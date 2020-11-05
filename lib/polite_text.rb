require 'polite_text/base'
require 'polite_text/text_scanner'
require 'polite_text/text_cleaner'

module PoliteText
  class << self
    def be_polite!(text, custom_swear_words_path = nil)
      PoliteText::TextCleaner.new(text, custom_swear_words_path).clean!
    end

    def is_polite?(text, custom_swear_words_path = nil)
      PoliteText::TextScanner.new(text, custom_swear_words_path).match_swear_word?
    end
  end
end
