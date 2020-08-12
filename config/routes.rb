Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup', to: 'users#new'
  resources :users only: [:new, :show ]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :projects only: [:new, :index, :update, :show, :destory]
  resources :tasks only: [:new, :index, :update, :show, :destory]

  get '/tasks_no_project', to: 'tasks#index_tasks_no_project'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
