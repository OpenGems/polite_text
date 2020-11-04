require 'polite_text/base'
require 'polite_text/swear_words_scanner'
require 'polite_text/swear_words_cleaner'

module PoliteText
  class Error < StandardError; end

  class << self
    def be_polite!(text)
      PoliteText::SwearWordsCleaner.new(text).clean
    end

    def is_polite?(text)
      PoliteText::SwearWordsScanner.new(text).match_swear_word?
    end
  end
end
