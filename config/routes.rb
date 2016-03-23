Rails.application.routes.draw do
  root "businesses#index"
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
  get 'ui(/:action)', controller: 'ui'
  resources :businesses, only: [:index, :show, :create, :new]
  get 'search_businesses', to: 'businesses#search'
  resources :users, only: [:create]
  get 'sign_up', to: 'users#new'
  get 'recent_review', to: 'reviews#index'
  resources :reviews, only: :create
  resources :users, only: :show
end
