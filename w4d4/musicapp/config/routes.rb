Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  resource :session, only: [:new, :create, :destroy]

  resources :bands
    resource :albums, only: [:new]

  resources :albums, only: [:create, :new, :edit, :show, :update, :destroy]
    resource :tracks, only: [:new]
end
