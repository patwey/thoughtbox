require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  def valid_link
    Link.new(title: "My title",
             url: "http://myurl.com")
  end

  test "is valid" do
    assert valid_link.valid?
  end

  test "is invalid without a title" do
    link = valid_link
    link.title = nil

    refute link.valid?
  end

  test "is invalid without a url" do
    link = valid_link
    link.url = nil

    refute link.valid?
  end

  test "is invalid without a proper url" do
    link = valid_link
    link.url = "()*&^%$$#"

    refute link.valid?
  end

  test "responds to user" do
    assert valid_link.respond_to? :user
  end
end
