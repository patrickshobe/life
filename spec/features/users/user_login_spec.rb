require 'rails_helper'

describe 'User Login' do
  it 'should allow a user to login' do
    user = User.create(username: "funbucket13", password: "test")

    visit '/'

    click_on "I already have an account"

    expect(current_path).to eq(login_path)
    fill_in "username", with: user.username
    fill_in "password", with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Log out")
  end
end
