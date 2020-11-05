module PoliteText
  class TextCleaner < Base
    attr_reader :text

    def initialize(text)
      raise ArgumentError.new('The text can not be nil') if text.nil?

      @text = text.to_s
    end

    def clean!
      text.gsub!(swear_words, '***')
    end
  end
end
