Rails.application.routes.draw do
  devise_for :users, controllers:{ 
    registrations:'users/registrations' 
  }
  resources :users
  
  resources :tweets do
    resources :likes
  end

  get '/tweets/:id/retweets', to: 'tweets#retweets', as: "retweet"
  root 'tweets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
