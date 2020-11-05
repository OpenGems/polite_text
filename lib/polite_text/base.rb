require 'yaml'

module PoliteText
  class Base
    def swear_words
      @swear_words ||= /\b(#{Regexp.union(swear_words_list).source})\b/
    end

    def swear_words_load_path
      "#{__dir__}/../locales/#{locale}.yml"
    end

    def swear_words_list
      YAML.load_file(swear_words_load_path)['swear_words']
    end

    private

    # TODO: Implement dynamic locale with I18N
    def locale
      @locale ||= 'en'
    end
  end
end
