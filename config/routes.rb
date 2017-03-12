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

 # get 'feed.rss', controller: :posts, action: :rss, format: 'rss' , path: '/posts/feed.rss'

  get 'feed/rss', controller: :posts, action: :rss, format: 'rss' , path: '/posts/feed.rss'
end
