# AdminlteThemed

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/adminlte_themed`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

```ruby
gem 'adminlte_themed'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install adminlte_themed
    

Install the gems:
  
https://github.com/kaminari/kaminari

    $ gem install kaminari

https://github.com/plataformatec/devise

    $ gem install devise

https://github.com/weppos/breadcrumbs_on_rails

    $ gem install breadcrumbs_on_rails

## Usage

To generate the controller and templates in the adminLte template:

    $ rails g adminlte_themed:controller YOUR_MODEL

Install 

With Gem BreadCrump_Rails:

    $ rails g adminlte_themed:controller -b YOUR_MODEL

With Gem Kaminari:

    $ rails g adminlte_themed:controller -k YOUR_MODEL

With Gem Devise:

    $ rails g adminlte_themed:controller -d YOUR_MODEL

No views, Controller only:

    $ rails g adminlte_themed:controller -sv YOUR_MODEL


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/adminlte_themed.

