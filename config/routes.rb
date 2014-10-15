Blogr::Engine.routes.draw do
  resources :posts
  root 'posts#index'
end
