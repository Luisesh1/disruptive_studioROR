Rails.application.routes.draw do
  get 'investments/index'
  get 'investments/calculateEarns'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'investments#index'
end
