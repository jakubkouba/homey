Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :projects
  resources :comments, only: [:create]
end
