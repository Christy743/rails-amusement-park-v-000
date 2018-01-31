Rails.application.routes.draw do
  root "application#home"

  get "/signin", :to => "sessions#new"
  post "/sessions/create", :to => "sessions#create"
  delete "/signout", :to => "sessions#destroy"

  post "ride", to: "rides#new"

  resources :users
  resources :attractions

end
