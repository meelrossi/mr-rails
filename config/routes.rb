Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  #wor-authentication routes
  post '/' => 'authentication#create'
  post '/renew' => 'authentication#renew'
  post '/invalidate_all' => 'authentication#invalidate_all'

  #book-model routes
  resources :books, only: [:show, :index]

  #rent-model routes
  resources :rents, only: [:show, :index, :create]

  # book-suggestion-model routes
  resources :book_suggestions, only: [:create]
end
