Rails.application.routes.draw do
   devise_for :users
   root to: 'items#index'
   resources :users, only: [:new, :create]
   get '/signup', to: 'users#new'
 
   # ログインフォームへのルーティング
   devise_scope :user do
      get '/users/sign_in', to: 'devise/sessions#new'
      delete '/users/sign_out', to: 'devise/sessions#destroy', as: :logout
   end
 end