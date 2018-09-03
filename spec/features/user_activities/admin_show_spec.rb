require 'rails_helper'

describe 'Admin Activity' do
  before(:each) do
    @user = create(:user, role: 1)
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
