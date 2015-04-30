require 'rails_helper'

RSpec.feature "CreateUsers", type: :feature do

  feature "user signs up" do
    scenario "with valid params as faculty" do
      visit '/signup'
       fill_in 'Email', with: 'faculty@uft.edu'
       fill_in 'Display Name', with: "Prof. Fake"
       select 'faculty'
       fill_in 'Password', with: 'password'
       click_button 'Create User'

      expect(page).to have_content('welcome')
    end

    scenario "with valid params as researcher" do
      visit '/signup'
       fill_in 'Email', with: 'researcher@uft.edu'
       fill_in 'Display Name', with: "Dr. Fake"
       select 'researcher'
       fill_in 'Password', with: 'password'
       click_button 'Create User'

      expect(page).to have_content('welcome')
    end

  end

  feature "outsider attempts to sign up"

    scenario 'without university email' do
      visit '/signup'
      fill_in 'Email', with: 'charlatan@ftu.edu'
      fill_in 'Display Name', with: "Mr. Nobody"
      select 'researcher'
      fill_in 'Password', with: 'password'
      click_button 'Create User'

      expect(page).to have_content('Error:')
    end

end
