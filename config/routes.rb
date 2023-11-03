Rails.application.routes.draw do
   devise_for :users
   root to: 'items#index'
   resources :items, only: [:index, :show, :new, :create]
  
   devise_scope :user do
     get '/users/sign_out' => 'devise/sessions#destroy'
   end
 end
 