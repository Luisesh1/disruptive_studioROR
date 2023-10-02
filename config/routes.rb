Rails.application.routes.draw do
  
  # config/routes.rb
  resources :investments, only: [:index]
  get 'investments/calculateEarns'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'investments#index'
end
