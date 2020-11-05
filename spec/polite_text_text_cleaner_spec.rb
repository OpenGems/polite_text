RSpec.describe PoliteText::TextCleaner do
  describe 'text' do
    let(:empty_text) { PoliteText::TextScanner.new('') }
    let(:nil_text) { PoliteText::TextScanner.new(nil) }

    it 'should not raise an ArgumentError error if text is empty' do
      expect { empty_text.clean! }.not_to raise_error(ArgumentError)
    end

    it 'should raise an ArgumentError error if text is nil' do
      expect { nil_text.clean! }.to raise_error(ArgumentError)
    end
  end

  describe '#clean!' do
    let(:sentence) { Faker::Lorem.sentence }
    let(:polite_string) { sentence }
    # TODO: Select the correct list based on I18N.
    # TODO: Select custom swear_words list if user sends its own.
    let(:swear_words_list) { PoliteText::Base.new.swear_words_list }
    let(:first_swear_word) { swear_words_list.sample }
    let(:second_swear_word) { swear_words_list.sample }
    let(:impolite_string) { "#{first_swear_word} #{second_swear_word} sentence #{first_swear_word}  #{second_swear_word}" }
    let(:impolite_text_cleaned) { PoliteText::TextCleaner.new(impolite_string).clean! }

    it 'should return nil for polite_string' do
      expect( PoliteText::TextCleaner.new(polite_string).clean! ).to be_nil
    end

    it 'should not return nil for impolite_string' do
      expect( impolite_text_cleaned ).not_to be_nil
    end

    it 'should return a string without the swear word' do
      expect( impolite_text_cleaned ).not_to be_nil
    end

    it 'should return a string without the first swear word' do
      expect( impolite_text_cleaned[first_swear_word] ).to be_nil
    end

    it 'should return a string without the second swear word' do
      expect( impolite_text_cleaned[second_swear_word] ).to be_nil
    end
  end
end
