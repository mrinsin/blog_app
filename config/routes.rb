Rails.application.routes.draw do

  #setting the landing page
  root 'users#index'

  get 'users/index'

  #the route where the registration information is posted
  post 'users/register'

  post 'users/login'

  get 'users/login'

  get 'users/welcome'

  post 'users/welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
