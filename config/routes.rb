Rails.application.routes.draw do
  devise_for :users
  root "links#index"
  resources :links
  resources :views, path: :v, only: [:show]
  get "up" => "rails/health#show", as: :rails_health_check
end
