Rails.application.routes.draw do
  root 'root#home'
  get '/party', to: 'root#party'
  get '/login', to: 'sessions#new'
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  namespace :api, defaults: { format: :json } do
    resources :images, only: [:create, :index, :show]
    resources :boats, only: [:new, :create, :index, :show]
    resources :rental_requests, only: [:new, :create, :index, :show]
  end
end
