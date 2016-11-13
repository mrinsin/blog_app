class UsersController < ApplicationController
  def index
  end

  def register

    #if there is no user in the database with the email address from the form
    if User.find_by_email_address(params[:email_address]).nil?
      #create a new user with form info, save into a variable and into the database
      @user = User.new(full_name: params[:full_name], email_address: params[:email_address], password: params[:password])

      @user.save
      #if there already exists a user with the email in the database
    else
      #alert the user and redirect to registration page
      flash[:notice] = "Email already in use, please try again"
      render :index and return
    end

  end

  def login

    #Making sure neither login fields are left blank
    if params[:login_email_address].strip.empty? || params[:login_email_address].nil? || params[:login_password].strip.empty? || params[:login_password].nil?
      #alert the user and bring them back to login
      flash[:alert] = "Please fill in both fields!"
      render :index and return
      #otherwise,if the fields are filled in
    else

      #if the login email does exist in our database
      if !User.find_by_email_address(params[:login_email_address]).nil?
        #Store that user's info in an instance variable
        @current_user = User.find_by_email_address(params[:login_email_address])
        @current_user.save
        #store the login password in a local variable
        pass = params[:login_password]

        #checking to see if the user's pw from the db matched the login password
        if pass == @current_user.password
          #store that user's information in a cookie and take them to the welcome page
          cookies[:user_id] = User.find(@current_user.id).to_yaml
          redirect_to '/users/welcome'
        #if the passwords dont match,
        else
          #alert user and render login page
          flash[:pass_notice] = "Invalid password! Please try again"
          render :index and return
        end #end of match passwords if

        #if the login email doesn't exist in our database
      else
        #alert the user and render login
        flash[:email_notice] = "Invalid email! Please try again"
        render :index and return
      end #end of user existence if

    end #end of blank fields if

  end #end of def login

  def welcome
    #load this cookie into the wlecome page
    @current_user = YAML.load(cookies[:user_id])

    if !params[:post_title].nil? && !params[:post_title].strip.empty? && !params[:post_message].nil? && !params[:post_message].strip.empty?

      @blog = Blog.new(title: params[:post_title], message: params[:post_message])

      @blog.user = @current_user

      @blog.save

    end
  end
end
