require 'yaml'

module PoliteText
  class Base
    def swear_words
      @swear_words ||= /\b(#{Regexp.union(swear_words_list).source})\b/
    end

    def swear_words_list()
      path = custom_swear_words_path ? custom_swear_words_path.to_s : swear_words_load_path
      YAML.load_file(path)['swear_words']
    end

    private

    def custom_swear_words_path
      @custom_swear_words_path ||= PoliteText.custom_swear_words_path
    end

    # TODO: Implement dynamic locale with I18N
    def locale
      @locale ||= 'en'
    end

    def swear_words_load_path
      "#{__dir__}/../locales/#{locale}.yml"
    end
  end
end
