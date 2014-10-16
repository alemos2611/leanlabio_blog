Blogr::Engine.routes.draw do
  resources :configurations

  resources :sessions
  resources :users do
    member do
      get 'dashboard'
    end
  end
  resources :posts
  root 'posts#index'
end
