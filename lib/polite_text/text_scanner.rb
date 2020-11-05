module PoliteText
  class TextScanner < Base
    attr_reader :text

    def initialize(text, custom_swear_words_path = nil)
      raise ArgumentError.new('The text can not be nil') if text.nil?

      @text = text.to_s
      @custom_swear_words_path = custom_swear_words_path
    end

    def match_swear_word?
      !@text.match?(swear_words(@custom_swear_words_path))
    end
  end
end
