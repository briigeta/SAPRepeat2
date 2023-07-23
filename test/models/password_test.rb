
require 'test_helper'

class PasswordTest < ActiveSupport::TestCase
  test "should not save password without website" do
    password = Password.new(username: "testuser", password: "testpass")
    assert_not password.save, "Saved the password without a website"
  end

  test "should not save password without a username" do
    password = Password.new(website: "example.com", password: "testpass")
    assert_not password.save, "Saved the password without a username"
  end

  test "should not save password without a password" do
    password = Password.new(website: "example.com", username: "testuser")
    assert_not password.save, "Saved the password without a password"
  end

  test "should save password with valid attributes" do
    password = Password.new(website: "example.com", username: "testuser", password: "testpass")
    assert password.save, "Could not save the password with valid attributes"
  end

  test "website should be unique" do
    existing_password = Password.create(website: "example.com", username: "testuser", password: "testpass")
    new_password = Password.new(website: "example.com", username: "anotheruser", password: "anotherpass")
    assert_not new_password.save, "Saved the password with a non-unique website"
  end

  test "should trim leading and trailing whitespaces from website, username, and password" do
    password = Password.new(website: "  example.com  ", username: "  testuser  ", password: "  testpass  ")
    password.save
    assert_equal "example.com", password.website
    assert_equal "testuser", password.username
    assert_equal "testpass", password.password
  end
end
