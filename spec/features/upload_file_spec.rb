require 'spec_helper'

describe 'File Uploading' do
  let(:user) { create(:user) }
  let(:file) { build(:file) }
  before(:each) { sign_user_in user }
  after(:each)  { sign_user_out }

  it 'should upload a valid file' do
    attach_file('input_file', "#{Rails.root}/example_input.tab")  
    click_button 'Upload!'
    expect(page).to have_content 'File successfully parsed!'
  end

  it 'should not parse invalid files' do
    attach_file('input_file', "#{Rails.root}/example_input_error.tab")
    click_button 'Upload!'
    expect(page).to have_content 'Error while parsing your, file'
  end

  it 'it should summarize the revenue of the parsed file' do
    attach_file('input_file', "#{Rails.root}/example_input.tab")  
    click_button 'Upload!'
    expect(page).to have_not_content "I'm gonna take your file, parse your data"
    expect(page).to have_content "of gross revenue"
  end
    
end