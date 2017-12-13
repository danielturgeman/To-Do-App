Rails.application.routes.draw do


  resources :accounts, only: [:create]
  get '/register', to: 'accounts#register'

  resources :session, only: [:new, :create]
  get '/auth/:user_id/:token', to: 'session#auth'
  

  get 'static/home'
  devise_for :users

  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'    

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items do
  	member do
  		patch :complete 
  	end
  	collection do
  		patch :sort
  	end
  end
  root 'items#index'
  root 'static#home'
end
