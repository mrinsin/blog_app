require 'rails_helper'

RSpec.feature "RegisterUsers", type: :feature do
  context 'Registering as a user' do
    #As an internet user, I can go to the website and register with a full name, email and password, and be taken to a page showing a registration success message AND my information
    Steps 'Submitting a registration form' do

      Given 'I am on the landing page' do
        visit '/'
      end

      Then 'I can fill out and submit a registration form' do
        fill_in 'full_name', with: 'Mrinalini Sinha'
        fill_in 'email_address', with: 'mrin@sin.com'
        fill_in 'password', with: 'mrinsin'
        click_button 'Register'
      end

      And 'I am taken to a success page that shows my information' do
        expect(page).to have_content("Success, Mrinalini Sinha!")
        expect(page).to have_content("Your email address is: mrin@sin.com")
      end

    end #end of steps
  end #end of context
end
