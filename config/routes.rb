Rails.application.routes.draw do
  root to: "welcome#index"

  get    "/login", to: "sessions#new"
  post   "/login", to: "sessions#create"
  get    "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]
  resources :links, only: [:index, :create, :update]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update], default: :json
    end
  end

end
