require 'rails_helper'

describe 'Visits Admin-User-Show' do
  context 'As an Admin' do
    it 'should show the user details' do
      create(:level)
      admin = create(:user, role: 1)
      user = create(:user, username: 'Ralph Wiggum')
      activity = create(:activity)
      user.user_activities.create(activity_id: activity.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_user_path(user)

      expect(page).to have_content(user.username)
      expect(page).to have_content("#{user.points} Points")
      expect(page).to have_content("Level #{user.level.level}")
      expect(page).to have_css('.progress-bar')
      expect(page).to have_content(user.activities.first.title)
    end
    it 'should allow admins to delete the user' do
      create(:level)
      admin = create(:user, role: 1)
      user = create(:user, username: 'Ralph Wiggum')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_user_path(user)

      click_on 'Delete'

      expect(current_path).to eq(admin_users_path)
      expect(page).to_not have_content(user.username)
    end
  end
  context 'as Anon' do
    it 'should show the 404 page' do
      user = create(:user)
      visit admin_user_path(user)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
  context 'as a user' do
    it 'should show the 404 page' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_user_path(user)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
