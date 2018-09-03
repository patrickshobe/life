require 'rails_helper'

describe' User Interactions' do
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


  end
end
