Rails.application.routes.draw do
  
  resources :lists, except: [:index] do
    resources :items, only: [:create]
  end
  
  devise_for :users
  
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end