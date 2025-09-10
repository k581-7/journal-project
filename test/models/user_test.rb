require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "username must be present" do
    user = User.new(username: "")
     assert !user.valid?, "User should have a username"
   end
end
