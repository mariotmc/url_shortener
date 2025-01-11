require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "links index" do
    get links_path
    assert_response :success

    get links_path(page: 2)
    assert_response :success
  end

  test "links show" do
    get link_path(links(:anonymous))
    assert_response :success
  end

  test "create link requires url" do
    post links_path, params: { link: { url: "" } }
    assert_response :unprocessable_entity
  end

  test "create link as guest" do
    assert_difference "Link.count", 2 do
      post links_path, params: { link: { url: "https://test.com" } }
      assert_response :redirect

      post links_path, params: { link: { url: "https://foobar.com" } }, as: :turbo_stream
      assert_response :success

      assert_nil Link.last.user
    end
  end

  test "create link as user" do
    user = users(:one)
    sign_in user

    assert_difference "Link.count" do
      post links_path, params: { link: { url: "https://foobar.com" } }, as: :turbo_stream
      assert_response :success

      assert_equal Link.last.user, user
    end
  end

  test "guest can not edit anonymous link" do
    get edit_link_path(links(:anonymous))
    assert_response :redirect
  end

  test "guest can not edit user's link" do
    get edit_link_path(links(:one))
    assert_response :redirect
  end

  test "user can edit their own link" do
    sign_in users(:one)
    get edit_link_path(links(:one))
    assert_response :success
  end

  test "user can not edit other user's link" do
    sign_in users(:one)
    get edit_link_path(links(:two))
    assert_response :redirect
  end

  test "user can not edit anonymous link" do
    sign_in users(:one)
    get edit_link_path(links(:anonymous))
    assert_response :redirect
  end
end
