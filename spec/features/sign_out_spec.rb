require 'rails_helper'

describe "Log out flow" do

  before do
    user = create(:user)
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    within 'form' do
      click_button 'Log in'
    end
  end

  describe "successful" do
    it "redirects to the login page" do
      click_link 'Sign out'
      expect(current_path).to eq new_user_session_path
    end
  end
end