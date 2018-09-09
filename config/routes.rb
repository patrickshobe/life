Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create, :show, :index]
  resources :activities, only: [:index, :show, :update]
  resources :user_activities, only: [:create, :new, :destroy, :index, :show, :update]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :activities
    resources :user_activities, only: [:create, :new, :destroy, :index, :show, :edit]
  end


end
