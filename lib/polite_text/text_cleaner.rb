module PoliteText
  class TextCleaner < Base
    attr_reader :text

    def initialize(text)
      @text = text.to_s

      validate_text!
    end

    def clean!
      text.gsub!(swear_words, '***')
    end

    private

    def validate_text!
      raise ArgumentError.new('The text can not be empty') if @text.empty?
    end
  end
end
