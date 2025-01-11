require "test_helper"

class UserTest < ActionDispatch::IntegrationTest
  test "guest user" do
    get links_path
    assert_select "a", "Sign up"
    assert_select "a", "Log in"
  end

  test "user can be logged in" do
    user = users(:one)
    sign_in user
    get links_path
    assert_select "a", "Profile"
  end
end
