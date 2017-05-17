Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  #wor-authentication routes
  post '/' => 'authentication#create'
  post '/renew' => 'authentication#renew'
  post '/invalidate_all' => 'authentication#invalidate_all'

  #book-model routes
  get '/books' => 'book#index'
  get '/books/:id' => 'book#show'
end
