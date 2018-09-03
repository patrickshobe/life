Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create, :show]
  resources :activities, only: [:index, :show]
  resources :user_activities, only: [:create, :new, :destroy, :index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users, only: [:index, :show]
    resources :activities
    resources :user_activities, only: [:create, :new, :destroy, :index, :show]
  end


end
