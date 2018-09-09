require 'rails_helper'

describe 'Visit Admin-User-Acitivities-Edit' do
  context 'as an admin' do
    it 'should allow the admin to edit the activity' do
      user = create(:user)
      admin = create(:user, username: 'Ralph Wiggum', role: 1)
      activity = create(:activity)
      activity_1 = create(:activity, title: 'Yell at the Sky')
      user_act_1 = user.user_activities.create(activity_id: activity.id)
      user.user_activities.create(activity_id: activity_1.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit edit_admin_user_activity_path(user_act_1)

      expect(page).to have_content("Edit #{user_act_1.id}")

      select activity_1.title, from: 'user_activity[activity_id]'
      select user.username, :from => 'user_activity[user_id]'
      click_on 'Update User activity'

      expect(page).to have_content("Activity ID: #{activity_1.id}")
      expect(current_path).to eq(admin_user_activity_path(user_act_1))

    end
  end
end
