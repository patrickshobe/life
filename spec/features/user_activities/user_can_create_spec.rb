require 'rails_helper'


describe 'User Interactions' do
  before(:each) do
    @user = create(:user)
    visit login_path

    fill_in 'username', with: @user.username
    fill_in 'password', with: 'test'
    click_on 'Log In'
  end
  it 'should show the individual activity' do
    activity = create(:activity)

    visit new_user_activity_path

    select activity.title, :from => "user_activity[activity_id]"
    click_on 'Create'

    expect(current_path).to eq(user_path(@user))

  end
end

