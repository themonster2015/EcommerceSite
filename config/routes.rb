Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :registrations => "user_registrations" }
  resources :products do
  resources :comments
  resources :payments 
  end
  resources :users
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'
  
  root 'static_pages#landing_page'
  post 'static_pages/thank_you'
  post 'payments/create'
  resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
