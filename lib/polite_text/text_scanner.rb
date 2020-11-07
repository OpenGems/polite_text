module PoliteText
  class TextScanner < Base
    attr_reader :text

    def initialize(text)
      raise ArgumentError.new('The text can not be nil') if text.nil?

      @text = text.to_s
    end

    def match_swear_word?
      !@text.match?(swear_words)
    end
  end
end
