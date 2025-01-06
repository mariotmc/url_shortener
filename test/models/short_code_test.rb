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
end
