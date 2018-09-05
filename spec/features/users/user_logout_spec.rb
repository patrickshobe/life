require 'rails_helper'

describe 'User Log Out' do
  it 'should allow a user to log Out' do

    Activity.create(id: 0, title: 'Sign Up!', points: 10, category: 'Other')
    Level.create!(level: 1, min_score: 0, max_score: 1000)
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

    expect(page).to have_content(user.username)
    expect(page).to have_content("Log Out")
    click_on 'Log Out'
    expect(current_path).to eq(login_path)
  end
end
