# PoliteText
[![Gem Version](https://badge.fury.io/rb/polite_text.svg)](https://badge.fury.io/rb/polite_text)
[![security](https://hakiri.io/github/OpenGems/polite_text/master.svg)](https://hakiri.io/github/OpenGems/polite_text/master)
![Gem](https://img.shields.io/gem/dt/polite_text)

PoliteText is making your users' input polite 👀

👉 Replace the swear words or execute callbacks if the input is not polite based on a default swear words list or your own.

## Installation 👨‍💻 👩‍💻

Add this line to your application's Gemfile:

```ruby
gem 'polite_text'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install polite_text

## Usage with the default swear words list 🌝

### Swear words  🔞
PoliteText has a default list of forbidden words, this list includes the most common swear words used on the web. You can acces the list of swear words [here](https://github.com/OpenGems/polite_text/blob/master/lib/locales/en.yml).

### Remove swear words 🤬
```
include PoliteText

str = "This gem is a fucking big shit but let's try it"

PoliteText.be_polite!(str)
=> "This gem is a *** big *** but let's try it"
```

### Check if string is polite 🙅‍♂️ 🙅‍♀️
```
include PoliteText

str = "This gem is a fucking big shit but let's try it"

PoliteText.is_polite?(str)
=> false
```

### Example for an Article model

```
# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  text      :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ApplicationRecord
  include PoliteText

  # Callbacks
  before_save :make_text_polite

  # Methods
  def make_text_polite
    PoliteText.be_polite!(text)
  end
end
```

## Usage with custom swear words list 🌞

### Custom swear words list  🔞
Create a custom list in a **YAML** file following this format :
```
# custom_swear_words.yml

swear_words:
  - gem
  - big
  - but
```

Place it where you want in your app, we recommend here : `./lib/polite_text/my_custom_swear_words.yml`

## Confirguration

📄 Create an initializer named `polite_text.rb`

✌️ Add the path to your custom swear words list like this :

```
# ./config/initializers/polite_text.rb

PoliteText.configure do |config|
  config.custom_swear_words_path = "#{__dir__}/../../lib/polite_text/custom_swear_words.yml"
end
```

PoliteText is now configured with your custom list ✨💫
```
str = "This gem is a fucking big shit but let's try it"

PoliteText.be_polite!(str)
=> "This *** is a fucking *** shit *** let's try it" 

PoliteText.is_polite?(str)
=> false
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/OpenGems/polite_text.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

### Todo 💪
- [ ] Manage locales with I18N for default swear words lists by country.
- [ ] Add default swear words lists from multiple languages.
- [ ] Improve the default swear words list and keeping it short.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
