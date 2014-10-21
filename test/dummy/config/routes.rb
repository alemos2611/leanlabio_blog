Rails.application.routes.draw do

  mount Blogr::Engine => "/blog"
  root 'static#index'
end
