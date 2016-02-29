require 'test_helper'

class UserCanLogInTest < ActionDispatch::IntegrationTest
  test "user can log in" do
    create_test_account # creates account with email: test@example.com
    visit "/"

    click_link "Log in"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    assert_equal current_path, "/links"
    assert page.has_content? "All Links"
  end

  test "user cannot log in with invalid email" do
    create_test_account # creates account with email: test@example.com

    visit "/login"
    fill_in "Email", with: "nonexistant@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    assert_equal current_path, "/login"
    assert page.has_content? "Invalid login"
  end

  test "user cannot log in with invalid password" do
    create_test_account # creates account with email: test@example.com

    visit "/login"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "bad password"
    click_button "Log in"

    assert_equal current_path, "/login"
    assert page.has_content? "Invalid login"
  end
end
