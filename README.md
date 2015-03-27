# RandomUsername

A random Heroku-style name generator.

# Installation

Add this line to your application's Gemfile:

    gem "random_username"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install random_username

## Usage

```
RandomUsername.username
=> "hollowlight"
=> "legitsunrise"
=> "earthyleaf"

RandomUsername.username(:min_length => 6, :max_length => 8)
=> "fitcow"
=> "boldhero"
=> "topchip"

RandomUsername.noun
=> "sunrise"
=> "prize"
=> "sage"

RandomUsername.adjective
=> "heroic"
=> "worthy"
=> "enigmatic"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Include tests with your changes (run `rake` to test)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
