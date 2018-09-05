require 'rails_helper'

describe 'Admin Activity' do
  before(:each) do


    Activity.create(id: 0, title: 'Sign Up!', points: 10, category: 'Other')
    @user = create(:user, role: 1)
    @user.user_activities.create(activity_id: 1)
    Level.create!(level: 1, min_score: 0, max_score: 1000)
    visit login_path

    fill_in 'username', with: @user.username
    fill_in 'password', with: 'test'
    click_on 'Log In'
  end
  it 'should see an individual UserActivity' do
    create(:activity)
    user_activity = UserActivity.create!(activity_id: 1, user_id: @user.id)

    visit admin_user_activity_path(user_activity.id)

    expect(page).to have_content("ID: #{user_activity.id}")
    expect(page).to have_content("Activity ID: #{user_activity.activity_id}")
    expect(page).to have_content("User ID: #{user_activity.user_id}")
  end
end
