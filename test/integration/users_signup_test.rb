require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "should not create a user" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, :user => { :name  => "",
                                  :email => "example@invalid",
                                  :password => "pas",
                                  :password_confirmation => "word" }
    end
    assert_template 'users/new'
  end
  
  test "should create user through form" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, :user => {  name: "TeadyBear",
                                                email: "Teady@Example.com",
                                                password: "IamTeddy",
                                                password_confirmation: "IamTeddy" }
    end
    assert_template 'users/show'
  end
end
