# VerifyUrls

Verify URL(s) with ease - CLI and Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'verify_urls'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install verify_urls

## Usage

__Command Line Interface (CLI)__

```
Usage: verify_urls --help
        --file=README.md             The file that contains the URLs to verify.
        --format=markdown            The file format (optional) - one of markdown, html, csv (if none given we'll try to infer it from the file path).
        --output=output.csv          CSV Output path
        --[no-]error-failed          Exit with non-zero status if any URL(s) failed.
    -h, --help                       How to use
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/buren/verify_urls.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
