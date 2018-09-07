require 'rails_helper'

describe 'Vists User-Activity-Show' do
  context 'As A user' do
    it 'should show the user activity info' do
      create(:level)
      user_1 = create(:user)
      user_2 = create(:user, username: 'Ralph Wiggum')
      activity = create(:activity)
      user_activity = user_2.user_activities.create(activity_id: activity.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit user_activity_path(user_activity)

      expect(page).to have_content(user_activity.activity.title)
      expect(page).to have_content(user_activity.user.username)
    end
  end
end
