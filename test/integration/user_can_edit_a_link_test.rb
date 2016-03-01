require 'test_helper'

class UserCanEditALinkTest < ActionDispatch::IntegrationTest
  def create_link
    visit "/links"
    fill_in "Title", with: "Google"
    fill_in "Url", with: "http://google.com"
    click_button "Submit link"
  end

  test "user can view edit form" do
    create_test_account # creates account with email: test@example.com
    create_link # creates a link with title: Google
    link_id = Link.last.id
    visit "/links"

    click_button "Edit"

    assert_equal "/links/#{link_id}/edit", current_path
  end

  test "user can edit a link title" do
    create_test_account # creates account with email: test@example.com
    create_link # creates a link with title: Google
    link_id = Link.last.id
    visit "/links/#{link_id}/edit"

    fill_in "Title", with: "Edited Title"
    click_button "Update link"

    assert_equal "/links", current_path
    assert page.has_content? "Edited Title"
  end

  test "user can edit a link url" do
    create_test_account # creates account with email: test@example.com
    create_link # creates a link with title: Google
    link_id = Link.last.id
    visit "/links/#{link_id}/edit"

    fill_in "Url", with: "http://turing.io"
    click_button "Update link"

    assert_equal "/links", current_path
    assert find_link("Google")[:href] == "http://turing.io"
  end

  test "user cannot edit a link to have invalid title" do
    create_test_account # creates account with email: test@example.com
    create_link # creates a link with title: Google
    link_id = Link.last.id
    visit "/links/#{link_id}/edit"

    fill_in "Title", with: ""
    click_button "Update link"

    assert_equal "/links/#{link_id}/edit", current_path
    assert page.has_content? "Invalid update"
  end

  test "user cannot edit a link to have invalid url" do
    create_test_account # creates account with email: test@example.com
    create_link # creates a link with title: Google
    link_id = Link.last.id
    visit "/links/#{link_id}/edit"

    fill_in "Url", with: "@!^*-"
    click_button "Update link"

    assert_equal "/links/#{link_id}/edit", current_path
    assert page.has_content? "Invalid update"
  end
end
