require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test 'layout links' do
    get root_path
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
  
  test "should get new" do
    get signup_path
    assert_response :success
    assert_select 'title', text: full_title("Sign up")
  end
end
