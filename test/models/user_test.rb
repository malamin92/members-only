require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: "Example User", email: "user@example.com", 
  		password: "password", password_confirmation: "password")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = "     "
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = "    "
  	@user.valid?
  end

  test "email should be unique" do
  	diff_user = @user.dup
  	diff_user.email = @user.email.upcase
  	@user.save
  	assert_not diff_user.valid?
  end

  test "password should be a certain length" do
  	@user.password = "a" * 5
  	assert_not @user.valid?
  end

  test "email should be a certain length" do
  	@user.password = "a" * 25
  	assert_not @user.valid?
  end

end
