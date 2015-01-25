Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :lists, except: [:index] do
    resources :items, only: [:create, :destroy]
  end
 
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end