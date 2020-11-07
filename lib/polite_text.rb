require 'polite_text/base'
require 'polite_text/text_scanner'
require 'polite_text/text_cleaner'

module PoliteText
  class << self
    attr_accessor :custom_swear_words_path

    def configure
      yield self if block_given?
      check_attrs
    end

    def be_polite!(text)
      PoliteText::TextCleaner.new(text).clean!
    end

    def is_polite?(text)
      PoliteText::TextScanner.new(text).match_swear_word?
    end

    private

    def check_attrs
      unless custom_swear_words_path.is_a?(::String)
        raise(ArgumentError, 'Invalid path to your custom swear words list.')
      end
    end
  end
end
