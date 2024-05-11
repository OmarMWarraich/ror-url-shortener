require "test_helper"

class UserTest < ActionDispatch::IntegrationTest
  test "guest user" do
    get links_path
    assert_select "a", "Sign up"
    assert_select "a", "Log in"
  end
  test "user can be logged in" do
    sign_in users(:one)
    get links_path
    assert_select "a", "Profile"
    assert_select "button", "Save"
  end
end
