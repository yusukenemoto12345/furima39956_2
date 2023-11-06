Rails.application.routes.draw do
   devise_for :users
   root to: 'items#index'
   resources :items
  
   devise_scope :user do
     get '/users/sign_out' => 'devise/sessions#destroy'
     get '/purchase', to: 'purchases#new', as: 'purchase' # 例として購入に関するルートを追加します
   end
 end
 