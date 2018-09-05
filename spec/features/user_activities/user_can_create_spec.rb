require 'rails_helper'

describe 'User Interactions' do
  it 'should show the individual activity' do
    activity = create(:activity)
    user = create(:user, username: 'Paul')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_user_activity_path

    select activity.title, :from => "user_activity[activity_id]"
    click_on 'Create'

    expect(current_path).to eq(user_path(user))

  end
end

describe 'Admin Interactions' do
  it 'should show the individual activity' do
    activity = create(:activity)
    user = create(:user)
    admin = create(:user, role: 1, username: 'admin')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit new_admin_user_activity_path

    select user.username, :from => "user_activity[user_id]"
    select activity.title, :from => "user_activity[activity_id]"
    click_on 'Create'

    expect(current_path).to eq(user_path(admin))

  end
end

