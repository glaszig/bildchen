require 'test_helper'
require 'uri'

class ResolverTest < Minitest::Test

  def setup
    @url = LOCALHOST + 'foo/bar'
    @resolver = Bildchen::Resolver.new @url
  end

  def test_initialize
    assert_equal @url, @resolver.uri.to_s
  end

  def test_resolve
    expected = LOCALHOST + 'foo/favicon.ico'
    assert_equal expected, @resolver.resolve
  end

  def test_downloadable?
    assert @resolver.send(:downloadable?, '/favicon.png', timeout: 10)
  end

  def test_candidates
    expected = [
      '/path/to/favicon.ico',
      '/path/to/favicon.png',
      '/path/to/favicon.gif',
      '/path/to/favicon.svg'
    ]
    result = @resolver.send(:candidates, '/path/to/foo')
    assert_equal expected, result
  end

end
