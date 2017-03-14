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
  post   '/login2',   to: 'sessions#create2'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'tags/:tag', to: 'static_pages#home', as: :tag
  get 'posts/:id', to: 'posts#show'

# special user case routes
  get 'users/:id/tags/:tag', to: 'users#show'
  get 'justjoined', to: 'users#justjoined'

# this is for letsencrypt to find and verify the site www.gymbull.com
  get '/.well-known/acme-challenge/vPm1E8Lk1tr2pU0kSVhDnWnB5JIrmuYQx17pbsKEwxI' ,   to: 'static_pages#letsencrypt1'
  
# this is for letsencrypt to find and verify the site gymbull.com
  get '/.well-known/acme-challenge/RQ5SDEpnhY0aY29Y5Dh55NanB1Zv_SEqKhkyMkGpR3E' ,   to: 'static_pages#letsencrypt2'

  resources :users do
    collection do
      match 'search' => 'users#index', via: [:get, :post], as: :search
    end
    
    member do
      get :following, :followers
      get :favorite_posts
      get '/reverse_mires', to: 'users#reverse_mires'
      get '/recent_mires', to: 'users#recent_mires'
    end
  end

  resources :favorite_posts,      only: [:create, :destroy]

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts do
    collection do
      match 'search' => 'posts#index', via: [:get, :post], as: :search
    end
    
    resources :comments
  end
  resources :relationships,       only: [:create, :destroy, :index_create, :index_destroy]
  resources :activities
  
end