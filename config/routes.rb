Rails.application.routes.draw do
  get "signup" =>  "users#new"
  resources :users, except: [:new]
  
  # root "posts#index"
end
