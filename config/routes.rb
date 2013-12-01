Site::Application.routes.draw do
  root 'static_pages#home'

  get "static_pages/home"
  get "users/new"

  match '/signup',  to: 'users#new',            via: 'get'
end
