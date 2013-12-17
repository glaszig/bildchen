require 'net/http'
require 'uri'

require 'bildchen/version'
require 'bildchen/resolver'

module Bildchen

  ICON_NAMES = %w(favicon.ico favicon.png favicon.gif favicon.png favicon.svg)

  def self.[] url
    @registry ||= {}
    @registry[url] ||= begin
      Resolver.new(url).resolve
    end
  end

end
