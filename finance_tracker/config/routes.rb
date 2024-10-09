Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "welcome#index"

  devise_for :users

  get "my_portfolio", to: "users#my_portfolio"

  get "search_stock", to: "stocks#search"

  resources :user_stocks, only: [ :create, :destroy ]

  get "my_friends", to: "users#my_friends"
  get "search_friend", to: "users#friend_search"
  resources :friendships, only: [ :create, :destroy ]

  resources :users, only: [ :show ]

  get "sandbox", to: "sandbox#index"
  post "turbo_steam_sandbox", to: "sandbox#turbo_stream_demo"
  get "turbo_frame_sandbox", to: "sandbox#turbo_frame_demo"
  get "turbo_frame_sandbox_with_input", to: "sandbox#turbo_frame_with_input_demo"
  post "turbo_stream_websocket_sandbox", to: "sandbox#turbo_stream_websocket_demo"
end
