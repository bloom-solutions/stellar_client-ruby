# StellarClient

[![Build Status](https://travis-ci.org/bloom-solutions/stellar_client-ruby.svg?branch=master)](https://travis-ci.org/bloom-solutions/stellar_client-ruby)

Ruby wrapper for Stellar's Bridge Server API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stellar_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stellar_client

## Usage

Configure in an initializer:

```ruby
StellarClient.configure do |c|
  c.bridge_host = ENV["BRIDGE_HOST"]
end
```

See `spec/acceptance` for detailed examples.

## Development

- Copy `spec/config.yml.sample` to `spec/config.yml`
- Replace `destination` with the account the tests will be sending to
- Copy `spec/fixtures/bridge/config_bridge.toml.sample` to `spec/fixtures/bridge/config_bridge.toml`
- Replace `authorizing_seed` with the seed of the account you're sending from
- Replace `receiving_account_id` with the account id you're sending from
- Replace `base_seed` with what you placed in `authorizing_seed`
- `docker-compose build`
- `docker-compose up bridge`
- Make your changes
- `rspec spec`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bloom-solutions/stellar_client-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
