Rails.application.routes.draw do


  root :to => "homes#top"
  get 'homes/about' => 'homes#about'

  get     'login',   to: 'sessions#new'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy'

  resources :users

  resources :todos

  get 'home/withdraw' => 'homes#withdraw'



end
