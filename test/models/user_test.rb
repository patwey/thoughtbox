require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def valid_user
    User.new(email: "test@example.com",
             password: "password",
             password_confirmation: "password")
  end

  test "is valid" do
    assert valid_user.valid?
  end

  test "is invalid without an email" do
    user = valid_user
    user.email = nil

    refute user.valid?
  end

  test "is invalid without a password" do
    user = valid_user
    user.password = nil

    refute user.valid?
  end

  test "is invalid without a confirmed password" do
    user = valid_user
    user.password_confirmation = "not password"

    refute user.valid?
  end

  test "responds to links" do
    assert valid_user.respond_to? :links
  end
end
