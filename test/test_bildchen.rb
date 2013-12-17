require 'helper'

class TestBildchen < MiniTest::Unit::TestCase

  def setup
    stub_request(:any, /example.com/)
  end

  def test_caching
    expected = URI("#{EXAMPLE_COM}/favicon.gif")
    assert_equal expected, Bildchen[EXAMPLE_COM]

    result = Bildchen.instance_variable_get :@registry
    expected = { EXAMPLE_COM => expected }
    assert_equal expected, result
  end

end
