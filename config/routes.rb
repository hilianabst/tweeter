Rails.application.routes.draw do
  #Ruta para active admin toggleable Button
  get 'users/:id/toggle_activation', to: 'users#toggle_activation', as: 'toggle_activation'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers:{ registrations:'users/registrations' }
  resources :users
  
  resources :tweets do
    resources :likes
  end
  get '/tweets/:id/retweets', to: 'tweets#retweets', as: "retweet"
  root 'tweets#index'
  get '/tweets/hashtag/:name', to: 'tweets#hashtags'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
