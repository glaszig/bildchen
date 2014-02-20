require 'test_helper'
require 'net/http'

class TestBildchen < MiniTest::Unit::TestCase

  def test_caching
    expected = LOCALHOST + 'favicon.png'
    assert_equal expected, Bildchen[LOCALHOST]

    result = Bildchen.instance_variable_get :@registry
    expected = { LOCALHOST => expected }
    assert_equal expected, result
  end

  def test_default_timeout
    assert_equal 5, Bildchen.timeout
  end

end
