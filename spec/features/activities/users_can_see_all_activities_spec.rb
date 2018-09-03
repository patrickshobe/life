require 'rails_helper'

describe 'User Interactions' do
  before(:each) do
    user = create(:user)
    visit login_path

    fill_in 'username', with: user.username
    fill_in 'password', with: 'test'
    click_on 'Log In'
  end
  it 'should show the user all of the activities' do
    activity_1 = create(:activity)
    activity_2 = create(:activity, title: 'Clean Your Room')

    visit activities_path

    expect(page).to have_content('All Activities')
    expect(page).to have_content(activity_1.title)
    expect(page).to have_content(activity_2.title)
  end
end
