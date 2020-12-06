Rails.application.routes.draw do

  post 'follow/:id' => 'relationships#create', as: 'follow'
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'
   get 'home/about' => 'homes#about'
  root 'homes#top'

   get 'follow/:id'  => 'users#follow'
  get 'follower/:id'  => 'users#follower'

  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books


end