# Bildchen

[![Build Status](https://github.com/glaszig/bildchen/actions/workflows/test.yml/badge.svg)](https://github.com/glaszig/bildchen/actions)

Ruby library which tries to find the most likely favicon for a given URL.  
It does so via HTTP HEAD requests and traversing up the URI path.

## Installation

Add this line to your application's Gemfile:

    gem 'bildchen', github: 'glaszig/bildchen'

And then execute:

    $ bundle

## Usage

Cached:

    Bildchen['http://www.example.com/path/to/somewhere']

Uncached:

    bildchen = Bildchen::Resolver.new 'http://www.example.com/path/to/somewhere'
    bildchen.resolve

### Configuration

HTTP timeouts default to 5 seconds and can be tuned as follows

    Bildchen.timeout = 10

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
