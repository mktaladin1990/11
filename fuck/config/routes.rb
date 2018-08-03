  Rails.application.routes.draw do
  # devise_for :users
     # get 'sessions/new'

     get 'products/home'
    root 'products#index'
    # get 'admin'
    # get     "login"    => "sessions#new"
    # post    "login"    => "sessions#create"
    # delete  "logout"   => "sessions#destroy"
devise_for :users, :controllers => {
           :sessions => "user/sessions",
           :registrations => "user/registrations"}
# , :controllers => { :sessions => 'users/sessions' }


    resources :products
    resources :users

    namespace :admin do
      resources :products
      get     "login"    => "products#index"
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
