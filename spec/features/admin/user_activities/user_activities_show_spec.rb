require 'rails_helper'

describe 'Visit Admin_User_Activities Show path' do
  context 'As an Admin' do
    it 'should Show the admin the user activity details' do
      user = create(:user)
      admin = create(:user, username: 'Ralph Wiggum', role: 1)
      activity = create(:activity)
      activity_1 = create(:activity, title: 'Yell at the Sky')
      user_act_1 = user.user_activities.create(activity_id: activity.id)
      user.user_activities.create(activity_id: activity_1.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_user_activity_path(user_act_1)

      expect(page).to have_content("ID: #{user_act_1.id}")
      expect(page).to have_content("Activity ID: #{user_act_1.activity_id}")
      expect(page).to have_content("User ID: #{user_act_1.user_id}")
    end
    it 'should have an edit button' do
      user = create(:user)
      admin = create(:user, username: 'Ralph Wiggum', role: 1)
      activity = create(:activity)
      create(:activity, title: 'Yell at the Sky')
      user_act_1 = user.user_activities.create(activity_id: activity.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_user_activity_path(user_act_1)

      click_on 'Edit'

      expect(current_path).to eq(edit_admin_user_activity_path(user_act_1))
    end
    it 'should have an delete button' do
      user = create(:user)
      admin = create(:user, username: 'Ralph Wiggum', role: 1)
      activity = create(:activity)
      create(:activity, title: 'Yell at the Sky')
      user_act_1 = user.user_activities.create(activity_id: activity.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_user_activity_path(user_act_1)

      click_on 'Delete'

      expect(page).to_not have_content(user_act_1.id)
      expect(current_path).to eq(admin_user_activities_path)
    end
    context 'as a user' do
      it 'should show the 404 page' do
      user = create(:user)
      activity = create(:activity)
      create(:activity, title: 'Yell at the Sky')
      user_act_1 = user.user_activities.create(activity_id: activity.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit admin_user_activity_path(user_act_1)

      expect(page).to have_content("The page you were looking for doesn't exist")
      end
    end
    context 'as an anon' do
      it 'should show the 404 page' do
      user = create(:user)
      activity = create(:activity)
      create(:activity, title: 'Yell at the Sky')
      user_act_1 = user.user_activities.create(activity_id: activity.id)

      visit admin_user_activity_path(user_act_1)

      expect(page).to have_content("The page you were looking for doesn't exist")
      end
    end
  end
end
