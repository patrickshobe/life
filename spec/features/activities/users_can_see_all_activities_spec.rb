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


    visit activities_path

    expect(page).to have_content('All Activities')
  end
end
