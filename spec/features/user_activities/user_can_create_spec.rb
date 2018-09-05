require 'rails_helper'

describe 'User Interactions' do
  it 'should show the individual activity' do


    Activity.create(id: 0, title: 'Sign Up!', points: 10, category: 'Other')
    user = create(:user, username: 'Paul')
    user.user_activities.create(activity_id: 1)
    Level.create!(level: 1, min_score: 0, max_score: 1000)
    activity = create(:activity)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_user_activity_path

    select activity.title, :from => "user_activity[activity_id]"
    click_on 'Create'

    expect(current_path).to eq(user_path(user))

  end
end

describe 'Admin Interactions' do
  it 'should show the individual activity' do
    Activity.create(id: 0, title: 'Sign Up!', points: 10, category: 'Other')
    Level.create!(level: 1, min_score: 0, max_score: 1000)
    activity = create(:activity)
    user = create(:user)
    admin = create(:user, role: 1, username: 'admin')
    user.user_activities.create(activity_id: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit new_admin_user_activity_path

    select user.username, :from => "user_activity[user_id]"
    select activity.title, :from => "user_activity[activity_id]"
    click_on 'Create'

    expect(current_path).to eq(user_path(admin))

  end
end

