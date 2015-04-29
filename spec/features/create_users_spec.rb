require 'rails_helper'

RSpec.feature "CreateUsers", type: :feature do

  feature "user signs up" do
    scenario "with valid params as faculty" do
      visit '/signup'
       fill_in 'Email', with: 'faculty@uft.edu'
       select 'Faculty'
       fill_in 'Password', with: 'password'
       click_button 'Sign up'

      expect(page).to have_content('welcome')
    end

    scenario "with valid params as researcher" do
      visit '/signup'
       fill_in 'Email', with: 'researcher@uft.edu'
       select 'Researcher'
       fill_in 'Password', with: 'password'
       click_button 'Sign up'

      expect(page).to have_content('welcome')
    end
  end

  pending "outsider attempts to sign up"


end
