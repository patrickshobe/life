require 'rails_helper'

describe 'User Features' do
  it 'should create a user' do
    username = "Bart"
    visit '/'

    within '.navbar' do
      click_on "Sign Up"
    end
    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: username
    fill_in :user_password, with: "test"


    within '.card-body' do
      click_on "Sign Up"
    end

    expect(page).to have_content("Welcome, #{username}!")
  end

  it 'should not double create a user' do
    user = User.create(username: 'Bart',
                       password: '12345')

    visit '/'


    within '.navbar' do
      click_on "Sign Up"
    end
    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: user.username
    fill_in :user_password, with: "test"


    within '.card-body' do
      click_on "Sign Up"
    end
    expect(page).to_not have_content("Welcome, #{user.username}!")
  end
end
