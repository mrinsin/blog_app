require 'rails_helper'

RSpec.feature "BlogPosts", type: :feature do

  #As a logged in user, I can create a blog post with a title and message on the welcome back page
  context 'Creating a blog post' do

    Steps 'Creating a new post' do

      Given 'I am on the landing page' do
        visit '/'
      end

      And 'I have registered as a user' do
        fill_in 'full_name', with: 'Mrinalini Sinha'
        fill_in 'email_address', with: 'mrin@sin.com'
        fill_in 'password', with: 'mrinsin'
        click_button 'Register'
      end

      And 'I have successfully logged in' do
        click_button 'Homepage'
        expect(page).to have_content("Please log in:")
        fill_in 'login_email_address', with: 'mrin@sin.com'
        fill_in 'login_password', with: 'mrinsin'
        click_button 'Log In'
      end

      Then 'I can create a new blog post with a title and message using the form' do
        fill_in 'post_title', with: 'First Post'
        fill_in 'post_message', with: 'This is my first blog post!'
        click_button 'Blog!'
      end

      #As a logged in user, I can see all my blog posts with title on the welcome back page
      And 'I can see my newly created post along with all past posts on the welcome back page' do
        expect(page).to have_content("First Post")
        expect(page).to have_content('This is my first blog post!')
      end
    end #end of steps
  end #end of context

end
