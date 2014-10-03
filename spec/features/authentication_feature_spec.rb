require 'spec_helper'

describe 'User authentication' do
  let(:user) { create(:user) }

  it 'allows user sign in with valid credentials' do
    sign_user_in user
    expect(page).to have_content('Signed in successfully')
  end

  it 'does not allow user sign in with invalid credentials' do
    sign_user_in user, password: 'not2day'
    expect(page).to have_content 'Invalid email or password'
  end

  it 'allows user to sign out' do
    sign_user_in user
    click_link 'Logout'
    expect(page).to have_content 'Sign in'
  end

  it 'shows upload file form after sign in' do
    sign_user_in user
    expect(page).to have_content 'Upload'
    expect(page).to have_field 'input_file', type:'file'
  end
end