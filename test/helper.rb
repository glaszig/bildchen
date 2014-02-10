require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'rubygems'
require 'minitest/autorun'
require 'minitest/pride'
require 'webmock/minitest'
require 'pry'

require 'bildchen'

EXAMPLE_COM = 'http://www.example.com/path/to/favicon.ico'
EXAMPLE_COM_BODY = <<HTML
<html>
<head>
</head>
<body>
</body>
</html>
HTML
