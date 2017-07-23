# Webmanager
Webmanager was born out of a need to quickly create blog type websites.
After looking at several other open source Rails CMS, webmanager was written to ensure the ease of installment and beautiful views to make the editiing of the content easier for developers as well as non developers.
Webmanager out of the box is protected by devise, has invitation system built in for the ease of user invitations.

## Usage
Create any empty rails application for your website and add `gem 'webmanager'` to your gem file. Webmanager is a Rails Engine that handles following for you:
######Authentication
Webmanager handles user management and authentication using rails `gem 'devise'`. Webmanager allows inviting users using rails `gem 'devise-invitable'`.
######Articles
######Articles Tagging
######Article Assets

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'webmanager'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install webmanager
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
