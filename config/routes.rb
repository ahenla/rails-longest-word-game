Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "games#index"
  get "new", to: "games#new"
  post "score", to: "games#score"
  # Defines the root path route ("/")
  # root "articles#index"
end
