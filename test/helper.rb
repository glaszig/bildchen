require 'rubygems'
require 'minitest/autorun'
require 'minitest/pride'
require 'webmock/minitest'
require 'bildchen'

EXAMPLE_COM = 'http://www.example.com/path'
EXAMPLE_COM_BODY = <<HTML
<html>
<head>
</head>
<body>
</body>
</html>
HTML
