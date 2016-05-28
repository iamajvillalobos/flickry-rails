Rails.application.routes.draw do
  root to: 'search_results#index'
  resources :search_results
end
