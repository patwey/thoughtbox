require 'test_helper'

class GuestCannotCreateALinkTest < ActionDispatch::IntegrationTest
  test "guest cannot see the create link form" do
    visit "/links"

    refute page.has_content? "Submit a Link"
  end
end
