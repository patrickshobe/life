require 'rails_helper'

describe 'Visits User-Acitivities-Index' do
  context 'As an Admin' do
    it 'Should show all of the user activities' do
      user = create(:user)
      admin = create(:user, username: 'Ralph Wiggum', role: 1)
      activity = create(:activity)
      activity_1 = create(:activity, title: 'Yell at the Sky')
      user_act_1 = user.user_activities.create(activity_id: activity.id)
      user_act_2 = user.user_activities.create(activity_id: activity_1.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_user_activities_path
      expect(page).to have_content(user_act_1.activity.title)
      expect(page).to have_content(user_act_1.user.username)
      expect(page).to have_content(user_act_1.created_at)
      expect(page).to have_content(user_act_2.activity.title)
      expect(page).to have_content(user_act_2.user.username)
      expect(page).to have_content(user_act_2.created_at)
    end
    it 'should allow an admin to delete' do
      user = create(:user)
      admin = create(:user, username: 'Ralph Wiggum', role: 1)
      activity = create(:activity)
      user_act_1 = user.user_activities.create(activity_id: activity.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_user_activities_path

      within "#user-activity-#{user_act_1.id}" do
        click_on 'Delete'
      end
      expect(page).to_not have_content(user_act_1.activity.title)
      expect(page).to_not have_content(user_act_1.user.username)
      expect(page).to_not have_content(user_act_1.created_at)
    end
  end
end
