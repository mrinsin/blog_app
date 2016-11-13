require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  #As a registered user, I can go to our website and log in with email and password, and be taken to a welcome back page showing my full name.
  #Hint: being logged in and out depends on having a cookie with the users ID. Put the users ID in a cookie called user_id, then later you can get access to the logged in user with User.find(cookies[:user_id])
  context 'Logging in' do
    Steps 'Logging in as a registered user' do

      Given 'I am on the landing page' do
        visit '/'
      end

      And 'I have registered as a user' do
        fill_in 'full_name', with: 'Mrinalini Sinha'
        fill_in 'email_address', with: 'mrin@sin.com'
        fill_in 'password', with: 'mrinsin'
        click_button 'Register'
      end

      Then 'I can log in using my email & password on the index page' do
        click_button 'Homepage'
        expect(page).to have_content("Please log in:")
        fill_in 'login_email_address', with: 'mrin@sin.com'
        fill_in 'login_password', with: 'mrinsin'
        click_button 'Log In'
      end

      And 'I am taken to a welcome page displaying my name' do
        expect(page).to have_content("Welcome back, Mrinalini Sinha!")
      end

    end #end of steps
  end #end of context

  context 'Logging out' do
    #
    Steps 'Logging out after a browsing session' do

      Given 'I am on the landing page' do
        visit '/'
      end

      And 'I have registered as a user' do
        fill_in 'full_name', with: 'Mrinalini Sinha'
        fill_in 'email_address', with: 'mrin@sin.com'
        fill_in 'password', with: 'mrinsin'
        click_button 'Register'
      end

      And 'I chave logged in with my info' do
        click_button 'Homepage'
        expect(page).to have_content("Please log in:")
        fill_in 'login_email_address', with: 'mrin@sin.com'
        fill_in 'login_password', with: 'mrinsin'
        click_button 'Log In'
      end

      And 'I am on the welcome page' do
        visit '/users/welcome'
      end

      Then 'I click o the log out button' do
        click_button 'Log Out'
      end

      Then 'I am logged out and taken back to the index page' do
        expect(page).to have_content('Please log in:')
      end
    end #end of Steps
  end #end of context

end
