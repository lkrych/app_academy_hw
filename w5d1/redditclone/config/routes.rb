Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  resources :posts
end
