Rails.application.routes.draw do
  # Ruta raíz (página de inicio)
  root "home#index"

  # Rutas RESTful principales
  resources :categories, only: [:index, :show]

  # Productos y Ofertas de Productos
  resources :products do
    resources :product_offers, only: [:new, :create] # Rutas anidadas para ofertas dentro de productos
  end

  # Rutas independientes para Product Offers
  resources :product_offers, only: [:index, :show, :new, :create] do
    resources :matches, only: [:create] # Matches asociados a Product Offers
  end

  # Rutas para Solicitudes y Matches
  resources :requests do
    resources :matches, only: [:create]
  end

  # Rutas para usuarios
  resources :users, only: [:new, :create, :show]
  resources :senior_sellers, only: [:new, :create]

  # Rutas personalizadas
  get '/contact', to: 'pages#contact'

  # Rutas para sesiones
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Rutas para registro
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'

  # Redirección de activos en desarrollo
  get '/stylesheets/*path', to: redirect('/assets/%{path}')
end