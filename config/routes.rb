Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users 
      
    end
  end 
       post '/auth/login', to: 'authentication#login'
       post '/passwords/forgot', to: 'passwords#forgot'
       put '/passwords/update', to: 'passwords#update'
       post '/contact/create_contact', to: 'contact#create_contact'
       get '/contact/show_contact/:id', to: 'contact#show_contact/:id'


end
