Rails.application.routes.draw do
  root 'sessions#new'

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :goals, only: [:create, :edit, :update, :destroy]
end
