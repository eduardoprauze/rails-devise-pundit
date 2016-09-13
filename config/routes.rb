Rails.application.routes.draw do

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :labels

  post 'add_label' => 'users#add_label'
  post 'delete_label' => 'users#delete_label'
end
