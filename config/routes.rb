Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup', to: 'users#new'
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :projects
  resources :tasks

  get '/tasks_no_project', to: 'tasks#index_tasks_no_project'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
