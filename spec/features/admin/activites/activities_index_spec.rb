require 'rails_helper'

describe 'Visit the Admin-Activity-Index' do
  context 'As an admin' do
    it 'should show all of the activities' do
      admin = create(:user, username: 'Ralph Wiggum', role: 1)
      activity = create(:activity)
      activity_1 = create(:activity, title: 'Yell at the Sky')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_activities_path

      expect(page).to have_content(activity.title)
      expect(page).to have_content("#{activity.points} Points")
      expect(page).to have_content(activity.description)
      expect(page).to have_content(activity_1.title)
      expect(page).to have_content("#{activity_1.points} Points")
      expect(page).to have_content(activity_1.description)
    end
    it 'should link to the edit activity path' do
      admin = create(:user, username: 'Ralph Wiggum', role: 1)
      activity = create(:activity)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_activities_path

      click_on 'Edit'

      expect(page).to have_content("Edit #{activity.title}")
      expect(current_path).to eq(edit_admin_activity_path(activity))
    end
  end
  context 'as a user' do
    it 'should show the 404 page' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_activities_path


      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
  context 'as a anon' do
    it 'should show the 404 page' do

      visit admin_activities_path


      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
