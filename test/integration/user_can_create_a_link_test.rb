require 'test_helper'

class UserCanCreateALinkTest < ActionDispatch::IntegrationTest
  test "user can create a link" do
    link_count = Link.count
    create_test_account # creates account with email: test@example.com
    visit "/links"

    fill_in "Title", with: "Google"
    fill_in "Url", with: "http://google.com"
    click_button "Submit link"

    assert_equal current_path, "/links"
    assert_equal (link_count + 1), Link.count
    assert page.has_content? "Google"
    assert page.has_content? "Read: false"
  end
end
