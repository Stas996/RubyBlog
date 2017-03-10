Rails.application.routes.draw do

  resources :articles do
    resources :comments, only: [:new, :create, :destroy]
  end

  resources :comments do
    resources :comments, only: [:new, :create, :destroy]
  end
  
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    resources :images, only: [:show, :create]
  end

  root 'articles#index'
end
