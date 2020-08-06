Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup', to: 'users#new'
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get  '/projects_no_group', to: 'projects#index_projects_no_group'
  get '/search' => 'projects#search'
  resources :projects

  get 'projects/new', to: 'projects#new'
  post 'projects/new', to: 'projects#create'
  get 'projects/index', to: 'projects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
