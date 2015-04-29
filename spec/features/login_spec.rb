require 'rails_helper'

RSpec.feature "SignIns", type: :feature do
  feature "user signs in" do
    scenario 'with valid params' do
      visit '/login'
      within('form') do
        fill_in 'Email', with: 'faculty@uft.edu'
        fill_in 'Password', with: 'password'
        click_button 'Login'

        expect(page).to have_content()

    end
  end
end
