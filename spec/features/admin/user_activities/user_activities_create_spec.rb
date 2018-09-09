require 'rails_helper'
  describe 'Visit the Admin-User-Activities-Create path' do
    context 'As an admin' do
      it 'should allow the admin to create' do
        create(:activity)
        create(:level)
        activity_2 = create(:activity, title: 'Mow the Lawn')
        user = create(:user)
        admin = create(:user, username: 'admin', role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        visit new_admin_user_activity_path

        expect(page).to have_content('Record Activity')

        select activity_2.title, from: 'user_activity[activity_id]'
        select user.username, :from => 'user_activity[user_id]'
        click_on 'Create'

        expect(page).to have_content(activity_2.title)
      end
    end
    context 'as an user' do
      it 'should show the 404 page' do
        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit new_admin_user_activity_path

        expect(page).to have_content("The page you were looking for doesn't exist")
      end
    context 'as an anon' do
      it 'should show the 404 page' do
        visit new_admin_user_activity_path

        expect(page).to have_content("The page you were looking for doesn't exist")
      end
    end
  end
end
