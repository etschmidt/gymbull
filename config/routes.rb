Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'
  
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'tags/:tag', to: 'static_pages#home', as: :tag
  
  get 'users/:id/tags/:tag', to: 'users#show'

  get 'gyms', to: 'gyms#index'
  
  post 'userpost', to: 'posts#create_user_post', as: 'userpost'
  post 'gympost', to: 'posts#create_gym_post', as: 'gympost'
 
  delete '/:id/posts/:id', to: 'posts#destroy'
  
  delete 'gyms/gyms/:id/posts/:id', to: 'posts#destroy_gym_post'
  
  resources :users do
    member do
      get :following, :followers
      get :posts
    end
  end
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]
  
  resources :gyms do
    member do
      get :followers
      get :posts
    end
  end
  
  resources :posts
end