require 'helper'
require 'uri'

class ResolverTest < MiniTest::Unit::TestCase

  def setup
    stub_request(:any, /example.com/)
    @resolver = Bildchen::Resolver.new(EXAMPLE_COM)
  end

  def test_initialize
    assert_equal EXAMPLE_COM, @resolver.uri.to_s
  end

  def test_downloadable?
    assert @resolver.send(:downloadable?, URI(EXAMPLE_COM).path, timeout: 10)
  end

  def test_apply_icon_names
    template = '/path/to/%{favicon}'
    expected = Bildchen::ICON_NAMES.map { |name| "/path/to/#{name}" }
    assert_equal expected, @resolver.send(:apply_icon_names, template)
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
