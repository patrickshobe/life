
require 'rails_helper'

describe 'Users Index' do
  it 'should show the user level' do
    user_0 = create(:user, password: 'user_1')
    user_1 = create(:user, username: 'user_2')
    user_2 = create(:user, username: 'user_3')
    user_3 = create(:user, username: 'user_4')
    create(:activity)
    Level.create!(level: 1, min_score: 100, max_score: 1000)
    user_0.user_activities.create!(activity_id: 1, user_id: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_0)
    visit users_path

    expect(page).to have_content(user_1.username)
    expect(page).to have_content(user_2.username)
    expect(page).to have_content(user_3.username)
  end
  it 'should link to the user show' do
    user_0 = create(:user, password: 'user_1')
    create(:user, username: 'user_2')
    create(:user, username: 'user_3')
    create(:user, username: 'user_4')
    create(:activity)
    Level.create!(level: 1, min_score: 100, max_score: 1000)
    user_0.user_activities.create!(activity_id: 1, user_id: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_0)
    visit users_path

    click_on user_0.username
    expect(page).to have_content(user_0.username)
    expect(current_path).to eq(user_path(user_0))
  end
end
describe 'Admin Users Index' do
  it 'should show the user level' do
    user_0 = create(:user, password: 'user_1', role: 1)
    user_1 = create(:user, username: 'user_2')
    user_2 = create(:user, username: 'user_3')
    user_3 = create(:user, username: 'user_4')
    create(:activity)
    Level.create!(level: 1, min_score: 100, max_score: 1000)
    user_0.user_activities.create!(activity_id: 1, user_id: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_0)
    visit admin_users_path

    expect(page).to have_content(user_1.username)
    expect(page).to have_content(user_2.username)
    expect(page).to have_content(user_3.username)
  end
  it 'should link to the user show' do
    user_0 = create(:user, password: 'user_1', role: 1)
    create(:user, username: 'user_2')
    create(:user, username: 'user_3')
    create(:user, username: 'user_4')
    create(:activity)
    Level.create!(level: 1, min_score: 100, max_score: 1000)
    user_0.user_activities.create!(activity_id: 1, user_id: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_0)
    visit admin_users_path

    click_on user_0.username
    expect(page).to have_content(user_0.username)
    expect(current_path).to eq(user_path(user_0))
  end
end
