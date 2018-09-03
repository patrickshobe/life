Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create, :show]
  resources :activities, only: [:index, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users, only: [:index]
    resources :activities
  end


end
