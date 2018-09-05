describe 'Visits Admin-User-Index' do
  context "as admin" do
    it "allows admin to see all users" do
      admin = create(:user, role: 1)
      user_1 = create(:user, username: 'Ralph Wiggum')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path
      expect(page).to have_content(admin.username)
      expect(page).to have_content(user_1.username)
      expect(current_path).to eq(admin_users_path)
    end
    it "Allows admins to delete users" do
      admin = create(:user, role: 1)
      user_1 = create(:user, username: 'Ralph Wiggum')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path
      expect(page).to have_content(admin.username)
      expect(page).to have_content(user_1.username)
      expect(current_path).to eq(admin_users_path)

      within "#user-#{user_1.id}" do
        click_on 'Delete'
      end

      expect(current_path).to eq(admin_users_path)
      expect(page).to_not have_content(user_1.username)
      end
    it "Allows links to the admin user show" do
      create(:level)
      admin = create(:user, role: 1)
      user_1 = create(:user, username: 'Ralph Wiggum')


      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path
      expect(page).to have_content(admin.username)
      expect(page).to have_content(user_1.username)
      expect(current_path).to eq(admin_users_path)

      within "#user-#{user_1.id}" do
        click_on user_1.username
      end

      expect(current_path).to eq(admin_user_path(user_1))
      expect(page).to have_content(user_1.username)
    end
  end
  context 'as Anon' do
    it 'should show the 404 page' do
      visit admin_users_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
  context 'as a user' do
    it 'should show the 404 page' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_users_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
