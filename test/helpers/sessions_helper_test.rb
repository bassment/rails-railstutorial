require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
  
  def setup
    @user = users(:sponge)
    remember(@user)
  end
  
  test "current user returns right user when logged in" do
    assert_equal @user, current_user
    assert is_logged_in?
  end
  
  test "current user returns false when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end