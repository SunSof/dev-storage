Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "user_sessions#new"

  get "login" => "user_sessions#new", as: "login"
  post "login" => "user_sessions#create"
  post "logout" => "user_sessions#destroy", as: "logout"

  get "show" => "properties#show", as: "properties_list"

  resources :users do
    member do
      get :show
    end
  end

  get ":id/show" => "users#show", as: "account"

  get "agents_list" => "users#agents_list", as: "agents_list"
end
