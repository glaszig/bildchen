require 'net/http'
require 'uri'

require 'bildchen/version'
require 'bildchen/resolver'

module Bildchen
  USER_AGENT = "Bildchen v#{VERSION} (github.com/glaszig/bildchen)"
  ICON_NAMES = %w(favicon.ico favicon.png favicon.gif favicon.svg)

  # Default timeout for Net::HTTP interactions
  @timeout = 5

  class << self
    attr_accessor :timeout
  end

  def self.[] url
    @registry ||= {}
    @registry[url] ||= begin
      Resolver.new(url).resolve
    end
  end
end
