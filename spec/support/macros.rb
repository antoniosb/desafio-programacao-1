require 'spec_helper'

def sign_user_in(user, opt={})
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: (opt[:password] || user.password)
  click_button 'Sign in'
end

def sign_user_out
  visit root_path
  click_link 'Logout'
end