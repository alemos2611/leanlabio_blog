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

#1: route def 
  match "/posts/feed.rss", :as => "feed/rss", :action => "rss" , via: [:post]
#1: route result   feed_rss POST   /posts/feed.rss(.:format)        blogr#rss

  #get 'feed/rss', controller: :posts, action: :rss, format: 'rss' , path: '/posts/feed.rss'
end
