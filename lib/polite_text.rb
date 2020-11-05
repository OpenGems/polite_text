require 'polite_text/base'
require 'polite_text/text_scanner'
require 'polite_text/text_cleaner'

module PoliteText
  class Error < StandardError; end

  class << self
    def be_polite!(text)
      PoliteText::TextCleaner.new(text).clean
    end

    def is_polite?(text)
      PoliteText::TextScanner.new(text).match_swear_word?
    end
  end
end
