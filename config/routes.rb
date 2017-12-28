Myflix::Application.routes.draw do
  root 'pages#front'

  get '/register', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

  get 'ui(/:action)', controller: 'ui'
  get '/home', to: 'videos#index'
  get '/my_queue', to: 'queue_items#index'
  resources :queue_items, only: [:create, :destroy]
  resources :videos, only: [:show, :index] do
    collection do
      get 'search'
    end
    resources :reviews, only: [:create]
  end
  resources :categories, only: [:show]
  resources :users, only: [:create]
end
