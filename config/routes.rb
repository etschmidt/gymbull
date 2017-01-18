Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'
  
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/calculator', to: 'static_pages#calculator'
  get  '/survey',  to: 'static_pages#survey' 
  get  '/alltags',  to: 'static_pages#alltags'
  get  '/sample',  to: 'static_pages#sample' 
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'tags/:tag', to: 'static_pages#home', as: :tag
  get 'posts/:id', to: 'posts#show'

  get 'users/:id/tags/:tag', to: 'users#show'
  
  get 'users', to: 'users#index_users'
  get 'gyms', to: 'users#index_gyms', as: 'gyms'

  resources :users do
    collection do
      match 'search' => 'users#index_gyms', via: [:get, :post], as: :search
    end
    
    member do
      get :following, :followers
      get :favorite_posts
    end
  end

  resources :favorite_posts,      only: [:create, :destroy]

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts do
    collection do
      match 'search' => 'static_pages#home', via: [:get, :post], as: :search
    end
    
    resources :comments
  end
  resources :relationships,       only: [:create, :destroy]
  resources :activities
  
end