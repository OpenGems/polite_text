module PoliteText
  class TextCleaner < Base
    attr_reader :text

    def initialize(text)
      return '' if text.nil? || text.empty?

      @text = text
    end

    def clean
      text.gsub!(swear_words, '***')
    end
  end
end
