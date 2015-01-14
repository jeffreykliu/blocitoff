Rails.application.routes.draw do
  
  resources :lists, except: [:index]

  devise_for :users
  
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end