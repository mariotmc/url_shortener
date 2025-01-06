require "test_helper"

class ShortCodeTest < ActiveSupport::TestCase
  test "encode" do
    assert_equal "0", ShortCode.encode(0)
    assert_equal "9", ShortCode.encode(9)
    assert_equal "a", ShortCode.encode(10)
    assert_equal "z", ShortCode.encode(35)
    assert_equal "A", ShortCode.encode(36)
    assert_equal "Z", ShortCode.encode(61)
    assert_equal "10", ShortCode.encode(62)
    assert_equal "100", ShortCode.encode(62*62)
    assert_equal "1000", ShortCode.encode(62*62*62)
    assert_equal "4c91", ShortCode.encode(999_999)
  end

  test "decode" do
    assert_equal 0, ShortCode.decode("0")
    assert_equal 9, ShortCode.decode("9")
    assert_equal 10, ShortCode.decode("a")
    assert_equal 35, ShortCode.decode("z")
    assert_equal 36, ShortCode.decode("A")
    assert_equal 61, ShortCode.decode("Z")
    assert_equal 62, ShortCode.decode("10")
    assert_equal 62*62, ShortCode.decode("100")
    assert_equal 62*62*62, ShortCode.decode("1000")
    assert_equal 999_999, ShortCode.decode("4c91")
  end
end
