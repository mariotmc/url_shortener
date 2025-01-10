require "test_helper"

class MetadataTest < ActiveSupport::TestCase
  test "title attribute" do
    assert_equal "foo", Metadata.new("<title>foo</title>").title
    assert_nil Metadata.new.title
  end

  test "description attribute" do
    assert_equal "foo", Metadata.new("<meta name='description' content='foo'>").description
    assert_nil Metadata.new.description
  end

  test "image attribute" do
    assert_equal "image.jpg", Metadata.new("<meta property='og:image' content='image.jpg'>").image
    assert_nil Metadata.new.image
  end
end
