Rails.application.routes.draw do

  resources :password_resets
  resources :posts do
    member do
      get "shares" => 'posts#shares'
      post "shares" => 'posts#send_to'
    end
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get "/login" => 'sessions#new', as: :login
  post "/login" => 'sessions#create'
  delete "/logout" => 'sessions#destroy', as: :logout
  # get '/posts/:id/share' => 'posts#share', as: :share
  # post '/posts/:id/share' => 'posts#send_to'

end
