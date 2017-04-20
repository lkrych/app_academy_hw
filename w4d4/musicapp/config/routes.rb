Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resource :albums, only: [:new]
  end

  resources :albums, only: [:create, :new, :edit, :show, :update, :destroy] do
    resource :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :new, :edit, :show, :update, :destroy]
end
