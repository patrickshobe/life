require 'rails_helper'

describe 'User Interactions' do
  before(:each) do
    @user = create(:user)
    visit login_path

    fill_in 'username', with: @user.username
    fill_in 'password', with: 'test'
    click_on 'Log In'
  end
  it 'should allow users to delete their user_activities' do
    activity = create(:activity)
    @user.user_activities.create(activity_id: activity.id)
    visit user_activities_path

    expect(page).to have_content(activity.title)

    click_on 'Delete'

    expect(page).to_not have_content(activity.title)
  end
end
describe 'Admin Interactions' do
  before(:each) do
    @admin = create(:user, role: 1)
    visit login_path

    fill_in 'username', with: @admin.username
    fill_in 'password', with: 'test'
    click_on 'Log In'
  end
  it 'should allow users to delete their user_activities' do
    activity = create(:activity)
    user = create(:user, username: 'Todd')
    user.user_activities.create(activity_id: activity.id)
    visit admin_user_activities_path

    expect(page).to have_content(activity.title)

    click_on 'Delete'

    expect(page).to_not have_content(activity.title)
  end
end
