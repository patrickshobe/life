require 'rails_helper'

describe 'visit Admin-Activity-Edit path' do
  context 'as an admin' do
    it 'should allow you to edit the activity' do
      admin = create(:user, username: 'Ralph Wiggum', role: 1)
      activity = create(:activity)

      new_title = 'Lost Maggie at the Grocery Store'
      new_category = 'Oops'
      new_points = 1500

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_activity_path(activity)

      expect(page).to have_content("Edit #{activity.title}")

      fill_in 'activity[title]', with: new_title
      fill_in 'activity[category]', with: new_category
      fill_in 'activity[points]', with: new_points
      click_on 'Edit'

      expect(page).to have_content(new_title)
      expect(page).to have_content(new_category)
      expect(page).to have_content("#{new_points} Points")
    end
  end
  context 'as a user' do
    it 'should render the 404 page' do
      user = create(:user)
      activity = create(:activity)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit edit_admin_activity_path(activity)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
  context 'as an anon' do
    it 'should render the 404 page' do
      activity = create(:activity)

      visit edit_admin_activity_path(activity)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
