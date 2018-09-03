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
describe 'Admin Interactions' do
  before(:each) do
    admin = create(:user, role: 1)
    visit login_path

    fill_in 'username', with: admin.username
    fill_in 'password', with: 'test'
    click_on 'Log In'
  end
  it 'should show all of the activities' do
    activity_1 = create(:activity)
    activity_2 = create(:activity, title: 'Play Shuffleboard')

    visit admin_activities_path

    expect(page).to have_content(activity_1.title)
    expect(page).to have_content(activity_2.title)
  end
  it 'should have an edit button' do
    activity = create(:activity)

    visit admin_activities_path

    expect(page).to have_content(activity.title)

    expect(page).to have_link('Edit')

    click_on 'Edit'

    expect(current_path).to eq(edit_admin_activity_path(activity))
  end
  it 'should have a delete button' do
    activity = create(:activity)

    visit admin_activities_path

    expect(page).to have_content(activity.title)

    expect(page).to have_link('Delete')

    click_on 'Delete'

    expect(current_path).to eq(admin_activities_path)
    expect(page).to have_content("Activity #{activity.title} Deleted")
  end

end
