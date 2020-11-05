module PoliteText
  class TextCleaner < Base
    attr_reader :text

    def initialize(text, custom_swear_words_path = nil)
      raise ArgumentError.new('The text can not be nil') if text.nil?

      @text = text.to_s
      @custom_swear_words_path = custom_swear_words_path
    end

    def clean!
      text.gsub!(swear_words(@custom_swear_words_path), '***') || text
    end
  end
end
