Rails.application.routes.draw do
  root "links#index"
  resources :links
  get "up" => "rails/health#show", as: :rails_health_check
end
