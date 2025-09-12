Rails.application.routes.draw do
  devise_for :users

  # Define routes outside authentication blocks so they're available for testing
  resources :tasks, only: [ :index ] do
    collection do
      get :today
    end
  end

  resources :categories do
    resources :tasks
  end

  # Root route handling
  authenticated :user do
    root "dashboard#index", as: :authenticated_root
  end

  unauthenticated do
    devise_scope :user do
      root "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
