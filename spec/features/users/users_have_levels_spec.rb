require 'rails_helper'

describe 'User Levels' do
  it 'should show the user level' do
    user = create(:user)
    create(:activity, points: 600)
    Level.create!(level: 1, min_score: 100, max_score: 1000)
    user.user_activities.create!(activity_id: 1, user_id: 1)

    visit user_path(user)

    expect(page).to have_content('Level 1')
  end
end
