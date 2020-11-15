Rails.application.routes.draw do
  resources :tickets
  resources :technicians
  resources :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tickets#index"
end
