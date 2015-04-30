require 'rails_helper'

RSpec.feature "Sign In", type: :feature do

  feature "user signs in" do
    before(:all) do
      User.create(name: "Prof. Fake", role: "faculty", email: "faculty@uft.edu", password: "password")
      User.create(name: "Dr. Fake", role: "researcher", email: "researcher@uft.edu", password: "password")
    end

    scenario 'as a faculty member' do
      visit '/login'
      within('form') do
        fill_in 'Email', with: 'faculty@uft.edu'
        fill_in 'Password', with: 'password'
        click_button 'Login'
      end
      expect(page).to have_content("@Prof. Fake")
    end

    scenario 'as a researcher' do
      visit '/login'
      within('form') do
        fill_in 'Email', with: 'researcher@uft.edu'
        fill_in 'Password', with: 'password'
        click_button 'Login'
      end
      expect(page).to have_content('@Dr. Fake')
    end

    scenario 'as a bad login' do
      visit '/login'
      within('form') do
        fill_in 'Email', with: 'researcher@uft.edu'
        fill_in 'Password', with: 'pissword'
        click_button 'Login'
      end
      expect(page).to have_content('Email/Password Incorrect')
    end
  end
end
