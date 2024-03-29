ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  fixtures :all
  
  def is_logged_in?
    !session[:user_id].nil?
  end
  
  # Logs in the test user
  def log_in_as(user, options = {})
    if integration_test?
      password    = options[:password]    || 'password'
      remember_me = options[:remember_me] || '1'
      post login_path, session: { email:        user.email,
                                  password:     password,
                                  remember_me:  remember_me }
    else
      session[:user_id] = user.id
    end
  end
  
  private
  
  def integration_test?
    defined?(post_via_redirect)
  end
end
