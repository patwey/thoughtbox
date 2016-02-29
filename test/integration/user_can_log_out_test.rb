require 'test_helper'

class UserCanLogOutTest < ActionDispatch::IntegrationTest
  test "user can see log out link" do
    create_test_account # creates account with email: test@example.com
    visit "/links"

    assert page.has_link? "Log out"
  end

  test "user can log out" do
    create_test_account # creates account with email: test@example.com
    visit "/links"

    click_link "Log out"

    assert_equal current_path, "/login"
    assert page.has_content? "Logged out"
  end

  test "guest cannot see log out link" do
    visit "/links"

    refute page.has_link? "Log out"
  end
end
