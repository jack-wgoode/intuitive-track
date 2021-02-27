Rails.application.routes.draw do
  #devise_for :technicians
  resources :tickets do
    resources :end_users
  end
  resources :end_users do
    resources :tickets
  end
  resources :technicians do 
    resources :tickets
    # root :to => "drinks#least_expensive" #, :id => '1'
    # get :current_user_drinks_order, on: :collection
    # get :current_user_drinks, on: :collection
  end 
  devise_for :technicians, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "sessions#new"
  # devise_scope :technician do
    root to: "tickets#index"
  # end


end
