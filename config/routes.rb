Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :api do
  	namespace :v1 do
  		post "/signin", to: "user_token#create"
  		post "/signup", to: "users#create"

  		resource :users, only: [:update, :destroy]
  	end
  end
end
