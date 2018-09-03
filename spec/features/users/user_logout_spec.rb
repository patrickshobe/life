require 'rails_helper'

describe 'User Log Out' do
  it 'should allow a user to log Out' do
    user = User.create(username: "funbucket13", password: "test")

    visit '/'

    within '.navbar' do
      click_on 'Login'
    end

    expect(current_path).to eq(login_path)
    fill_in "username", with: user.username
    fill_in "password", with: user.password

    within '.card-body' do
      click_on "Log In"
    end

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Log out")
    click_on 'Log out'
    expect(current_path).to eq(login_path)
  end
end
