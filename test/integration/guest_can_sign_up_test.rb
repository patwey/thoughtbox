require 'test_helper'

class GuestCanSignUpTest < ActionDispatch::IntegrationTest
  test "guest can sign up with valid email address and password" do
    visit "/"

    click_link "Sign up"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    assert_equal "/links", current_path
    assert page.has_content? "All Links"
  end

  test "guest cannot sign up with email that has been taken" do
    create_test_account # creates account with email: test@example.com
    create_test_account

    assert_equal "/users/new", current_path
    assert page.has_content? "Invalid login"
  end

  test "guest cannot create account with mismatched password confirmation" do
    visit "/users/new"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "not password"
    click_button "Create Account"

    assert_equal "/users/new", current_path
    assert page.has_content? "Invalid login"
  end
end
