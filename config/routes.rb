Rails.application.routes.draw do
  root 'sessions#new'

  resources :comments, only: [:create, :destroy]
  # resources :user_comments, only: [:create, :destroy]
  resources :goal_comments, only: [:create, :destroy]
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :goals, only: [:create, :edit, :update, :destroy]
end
