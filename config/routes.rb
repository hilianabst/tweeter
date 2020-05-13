Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers:{ 
    registrations:'users/registrations' 
  }
  resources :users
  
  resources :tweets do
    resources :likes
  end

  get '/tweets/:id/retweets', to: 'tweets#retweets', as: "retweet"
  root 'tweets#index'
  get '/tweets/hashtag/:name', to: 'tweets#hashtags'
  get '/tweets/api/news', to: 'tweets#apis'
  get '/tweets/api/:fecha1/:fecha2', to: 'tweets#apis'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
