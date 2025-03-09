Rails.application.routes.draw do
  get "products/new"
  get "products/create"
  get "products/show"
  get "products/edit"
  get "products/update"
  get "products/destroy"
  # Ruta raíz (página principal)
  root "pages#home"

  # Rutas para categorías
  resources :categories, only: [:index, :show]

  # Ruta de verificación de salud (opcional, puedes dejarla comentada si no la usas)
  # get "up" => "rails/health#show", as: :rails_health_check
end 