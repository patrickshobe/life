require 'rails_helper'


describe 'User Interactions' do
  before(:each) do
    user = create(:user)
    visit login_path

    fill_in 'username', with: user.username
    fill_in 'password', with: 'test'
    click_on 'Log In'
  end
  it 'should show the individual activity' do
    activity = create(:activity)

    visit activity_path(activity)

    expect(page).to have_content(activity.title)
    expect(page).to have_content("#{activity.points} Points")
    expect(page).to have_content(activity.category)
  end
end
