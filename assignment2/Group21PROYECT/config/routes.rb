Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/Home', to: 'static_pages#Home'
  root 'static_pages#Home'
  resources :boards do 
    resources :states
    #resources :user_to_boards
    resources :user_to_boards, only: [:new, :create, :destroy]
  end
  resources :states
  resources :tasks
  resources :users
  resources :user_to_boards
end
