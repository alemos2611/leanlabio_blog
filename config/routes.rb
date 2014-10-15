Blogr::Engine.routes.draw do
  resources :sessions
  resources :users
  resources :posts
  root 'posts#index'
end
