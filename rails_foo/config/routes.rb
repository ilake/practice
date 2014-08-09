RailsFoo::Application.routes.draw do
  get '/restrict', :to => 'home#restrict'
  resources :messages do
    collection { get :events }
  end
  resources :posts
  root 'home#index'
end
