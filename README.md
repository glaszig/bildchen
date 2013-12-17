# Bildchen

[![Build Status](https://travis-ci.org/glaszig/bildchen.png?branch=master)](https://travis-ci.org/glaszig/bildchen)
[![Coverage Status](https://coveralls.io/repos/glaszig/bildchen/badge.png)](https://coveralls.io/r/glaszig/bildchen)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/glaszig/bildchen/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

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


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
