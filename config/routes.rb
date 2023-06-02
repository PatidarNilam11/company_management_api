Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :companies
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'

 resources :project_clients
end
