require 'rails_helper'

describe 'User Features' do
  it 'should create a user' do
    username = "Bart"
    visit '/'

    click_on "Sign Up to Be a User"
    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: username
    fill_in :user_password, with: "test"

    click_on "Create User"

    expect(page).to have_content("Welcome, #{username}!")
  end
end
