# frozen_string_literal: true

RSpec.describe PoliteText::TextScanner do
  describe 'text' do
    let(:empty_text) { PoliteText::TextScanner.new('') }
    let(:nil_text) { PoliteText::TextScanner.new(nil) }

    it 'should raise an ArgumentError error if text is empty' do
      expect { empty_text.match_swear_word? }.not_to raise_error(ArgumentError)
    end

    it 'should raise an ArgumentError error if text is nil' do
      expect { nil_text.match_swear_word? }.to raise_error(ArgumentError)
    end
  end

  describe '#match_swear_word?' do
    let(:sentence) { Faker::Lorem.sentence }
    let(:polite_string) { sentence }
    # TODO: Select the correct list based on I18N.
    # TODO: Select custom swear_words list if user sends its own.
    let(:swear_words_list) { PoliteText::Base.new.swear_words_list }
    let(:impolite_string) { sentence + swear_words_list.sample }

    it 'should return true when text doesn\'t contains swear words' do
      expect( PoliteText::TextScanner.new(polite_string).match_swear_word? ).to equal(true)
    end

    it 'should return true when text contains swear words' do
      expect( PoliteText::TextScanner.new(impolite_string).match_swear_word? ).to equal(false)
    end
  end
end
