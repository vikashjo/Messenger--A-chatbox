Rails.application.routes.draw do
  get "signin" => "sessions#new"
  post "signin" => "sessions#create"
  delete "signout" => "sessions#destroy"
  
  get "signup" =>  "users#new"
  resources :users, except: [:new]
  
  root "chatroom#index"
end
