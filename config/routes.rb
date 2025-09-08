Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # devise_for :users, controllers: {
  #   sessions: "users/sessions"
  # }
  devise_for :users
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  # get "/users" => "users#index"
  # get "/users/new" => "users#new", as: "new_user"
  # post "/users" => "users#create", as: "create_user"
  # get "/users/:id" => "users#show", as: "user"
  # get "/users/:id/edit" => "users#edit", as: "edit_user"
  # patch "/users/:id" => "users#update"
  # put "/users/:id" => "users#update"
  # delete "/users/:id" => "users#destroy", as: "delete_user"
  authenticated :user do
    root "dashboard#index", as: :authenticated_root
    resources :categories
  end
  
  unauthenticated do
    devise_scope :user do
      root "devise/sessions#new", as: :unauthenticated_root
      resources :users, only: [:index, :show]
    end
  end
end


  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

