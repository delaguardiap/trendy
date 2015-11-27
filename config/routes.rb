Rails.application.routes.draw do

  get 'check_ins/create'

  get 'check_ins/destroy'

  resources :users
  resources :venues
  root 'static_pages#home'
  
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  post 'search' => 'static_pages#search'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  post 'check_in' => 'check_ins#create'
  delete 'check_in' => 'check_ins#destroy'
  post 'vote' => 'check_ins#vote_submit'
  post 'downvote' => 'check_ins#downvote_submit'
  
end
