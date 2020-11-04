module PoliteText
  class SwearWordsScanner < Base
    attr_reader :text

    def initialize(text)
      return false if text.nil? || text.empty?

      @text = text
    end

    def match_swear_word?
      !@text.match?(swear_words)
    end
  end
end
