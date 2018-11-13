Rails.application.routes.draw do
  get 'cates/index'
  resources :products
  resources :categories
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
