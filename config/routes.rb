Rails.application.routes.draw do
  devise_for :technicians
  resources :tickets
  resources :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tickets#index"
end
