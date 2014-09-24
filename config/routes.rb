Rails.application.routes.draw do
  root 'root#home'
  get '/login', to: 'sessions#new'
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  namespace :api, defaults: { format: :json } do
    resources :boats, only: [:new, :create, :index, :show]
  end
end
