# JTRailsGeneratorUser

[![Gem Version](https://badge.fury.io/rb/jt-rails-generator-user.svg)](http://badge.fury.io/rb/jt-rails-generator-user)

JTRailsGeneratorUser is a generator for user authentication. You have the login and sign up page and password forgot feature.

## Installation

JTRailsGeneratorUser is distributed as a gem, which is how it should be used in your app.

Include the gem in your Gemfile:

    gem 'jt-rails-generator-user', '~> 1.0'

## Usage

You just have to use the generator with:

	rails g jt:user

Include `CurrentUser` in your `ApplicationController`:

```ruby
class ApplicationController < ActionController::Base
	include CurrentUser
	...
end
```

## What's does it generate?

- `User` model with only email, password and password_token (for password forgot feature)
- `SessionController` for the login
- `UsersController` for the sign up and password forgot feature
- `UserMailer` for sending password reset instructions 
- `CurrentUser` module which manage `current_user` variable and `require_user` filter 

## Author

- [Jonathan VUKOVICH TRIBOUHARET](https://github.com/jonathantribouharet) ([@johnvuko](https://twitter.com/johnvuko))

## License

JTRailsGeneratorUser is released under the MIT license. See the LICENSE file for more info.
