Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :api do
  	namespace :v1 do
  		post "/signin", to: "user_token#create"
  		post "/signup", to: "users#create"

  		resource :users, only: [:update, :destroy]

      post "questions/:id/answer", to: "questions#answer"

      resources :questions, only: [:show, :create, :update, :destroy]

  		resources :categories, only: [:index, :show, :create, :update, :destroy] do
        resources :questions, only: [:index, :create]
        get "/get_questions", to: "categories#get_questions"
      end
  	end
  end
end
