require "rails_helper"

describe "User visits users index page" do

  context "as default user" do
  it 'does not allow default user to see admin categories index' do
    user = User.create(username: "fern@gully.com",
                       password: "password",
                       role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_users_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
  context 'An Anon visits the user page' do
    it 'should show them a 404 page' do
      visit users_path

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end

