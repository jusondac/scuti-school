Rails.application.routes.draw do
  devise_for :users
  get "/auth/:provider/callback" => "sessions/omni_auths#create", as: :omniauth_callback
  get "/auth/failure" => "sessions/omni_auths#failure", as: :omniauth_failure

  # get "home/index"
  root "home#index"

  resources :class_rooms do
    member do
      post :join
      post :approve_student
      post :reject_student
    end
  end

  resources :agencies do
    collection do
      post :bulk_action
    end
    member do
      post :approve
      post :reject
    end
  end

  resources :users, only: [ :index ] do
    collection do
      get :students
      get :teachers
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
