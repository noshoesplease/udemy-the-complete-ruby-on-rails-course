Rails.application.routes.draw do
  get "kanban/index"
  get "kanban/update_status"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"
  devise_for :users, controllers: { registrations: "registrations" }


  resources :teams do
    resources :memberships do
      collection do
        post :invite
      end
    end
    resources :projects

    resources :kanban, only: [ :index ] do
      patch "update_status", on: :collection
    end
  end

  resources :artifacts
  resources :user_projects
end
