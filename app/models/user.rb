# app/models/user.rb
class User < ApplicationRecord
    # Relación: Un usuario puede tener muchos productos
    has_many :products, dependent: :destroy
    has_one_attached :profile_picture
    has_one_attached :logo
    has_many :product_offers, dependent: :destroy 
    has_many :service_requests
    

  
    # Otras Relaciones y Validaciones
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }, on: :create
    validates :profile_picture, presence: true, allow_nil: true
    validates :logo, presence: true, allow_nil: true
    validates :description, presence: true, length: { maximum: 500 }
  
    # Autenticación (usando bcrypt para manejo de contraseñas)
    has_secure_password
  end 
