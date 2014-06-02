RailsFoo::Application.routes.draw do
  root 'home#index'
  get '/restrict', :to => 'home#restrict'
  resources :posts
end
