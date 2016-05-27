Rails.application.routes.draw do
  root to: 'pages#index'
  get 'pages/index'

  resources :search_results
end
