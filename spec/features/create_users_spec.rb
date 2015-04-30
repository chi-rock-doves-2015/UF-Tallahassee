require 'rails_helper'
# require 'database_cleaner'

RSpec.feature "CreateUsers", type: :feature do
  before(:all) do
    DatabaseCleaner.clean_with :truncation
  end
  feature "user signs up" do
    scenario "with valid params as faculty" do
      visit '/signup'
       fill_in 'Email', with: 'faculty@uft.edu'
       fill_in 'Display Name', with: "Prof. Fake"
       select 'faculty'
       fill_in 'Password', with: 'password'
       click_button 'Create User'

      expect(page).to have_content('@Prof. Fake')
    end

    scenario "with valid params as researcher" do
      visit '/signup'
       fill_in 'Email', with: 'researcher@uft.edu'
       fill_in 'Display Name', with: "Dr. Fake"
       select 'researcher'
       fill_in 'Password', with: 'password'
       click_button 'Create User'

      expect(page).to have_content('@Dr. Fake')
    end

  end

  feature "outsider attempts to sign up" do

    scenario 'without university email' do
      visit '/signup'
      fill_in 'Email', with: 'charlatan@ftu.edu'
      fill_in 'Display Name', with: "Mr. Nobody"
      select 'researcher'
      fill_in 'Password', with: 'password'
      click_button 'Create User'

      expect(page).to have_content('must be registered with UFT')
    end
  end

end
