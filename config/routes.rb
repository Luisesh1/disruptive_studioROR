Rails.application.routes.draw do
  resources :investments, only: [:index]
  get 'investments/calculateEarns'
  get 'investments/downloads'
  root 'investments#index'
end
