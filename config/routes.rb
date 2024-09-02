Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/create'
  get 'messages/destroy'
  get "signin" => "sessions#new"
  post "signin" => "sessions#create"
  delete "signout" => "sessions#destroy"
  
  get "signup" =>  "users#new"
  resources :users, except: [:new]
  resources :messages
  resources :chatroom, except: [:index]
  
  root "chatroom#index"
end
