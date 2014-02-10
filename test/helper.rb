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
require 'pry'
require 'webrick'
require 'stringio'
require 'bildchen'

LOCALHOST = 'http://localhost:56123/'

webrick = {
  BindAddress: '127.0.0.1', Port: 56123,
  # AccessLog: [], Logger: WEBrick::Log::new(StringIO.new, 7),
  DocumentRoot: File.expand_path('../webroot', __FILE__)
}

server_thread = Thread.new do
  WEBrick::HTTPServer.new(webrick).start
end
sleep 1
