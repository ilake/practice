RailsFoo::Application.routes.draw do
  get '/restrict', :to => 'home#restrict'
  get '/faye', :to => 'faye#index'
  resources :messages do
    collection { get :events }
  end
  resources :posts
  root 'home#index'
end
