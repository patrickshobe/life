require 'rails_helper'

describe 'Visit Admin-Activities-Show page' do
  context 'as an admin' do
    it 'should show the activity info' do
      admin = create(:user, username: 'Ralph Wiggum', role: 1)
      activity = create(:activity)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_activity_path(activity)

      expect(page).to have_content(activity.title)
      expect(page).to have_content("#{activity.points} Points")
      expect(page).to have_content(activity.description)
    end
    it 'should link to the edit activity path' do
      admin = create(:user, username: 'Ralph Wiggum', role: 1)
      activity = create(:activity)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_activity_path(activity)

      click_on 'Edit'

      expect(page).to have_content("Edit #{activity.title}")
      expect(current_path).to eq(edit_admin_activity_path(activity))
    end
  end
  context 'as a user' do
    it 'should show the 404 page' do
      user = create(:user)
      activity = create(:activity)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_activity_path(activity)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
  context 'as a anon' do
    it 'should show the 404 page' do
      activity = create(:activity)

      visit admin_activity_path(activity)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
