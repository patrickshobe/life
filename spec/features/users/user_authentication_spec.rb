require 'rails_helper'

describe 'User Features' do
  it 'should create a user' do

    Activity.create(id: 0, title: 'Sign Up!', points: 10, category: 'Other')
    Level.create!(level: 1, min_score: 0, max_score: 1000)
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

    expect(page).to have_content(username)
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
    expect(page).to_not have_content(user.username)
  end
end
