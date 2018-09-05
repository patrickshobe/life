require 'rails_helper'

describe 'User interactions' do
  before(:each) do
    Activity.create(id: 0, title: 'Sign Up!', points: 10, category: 'Other')
    @user = create(:user, username: 'Paul')
    @user.user_activities.create(activity_id: 1)
    Level.create!(level: 1, min_score: 0, max_score: 1000)
    visit login_path

    fill_in 'username', with: @user.username
    fill_in 'password', with: 'test'
    click_on 'Log In'
  end
  it 'should allow the user to delete' do
    activity = create(:activity)
    @user.user_activities.create(activity_id: activity.id)
    visit user_activities_path

    expect(page).to have_content(activity.title)
    click_on 'Delete'

    expect(page).to_not have_content(activity.title)
  end
end
