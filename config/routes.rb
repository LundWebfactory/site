Site::Application.routes.draw do
  resources :users do
    member do    
      put :'toggle_admin'
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :categories do
    resources :subcategories
  end

  resources :posts

  root 'static_pages#home'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',            via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
