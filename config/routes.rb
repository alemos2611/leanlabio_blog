Blogr::Engine.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'

  resources :subscribers
  resources :sessions
  resources :authors do
    member do
      get 'dashboard'
    end
  end
  resources :posts, path: "/"
  root 'posts#index'
end
