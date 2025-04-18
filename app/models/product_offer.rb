class ProductOffer < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true 
  has_many :matches, dependent: :destroy #Relación con el Match 
  has_one_attached :photo 

  # Validaciones básicas
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category_id, presence: true

  # Si hay campos condicionales como service_type, también se pueden validar
  validates :service_type, presence: true, if: -> { category&.name == "Mercado Laboral" }
  validates :experience_years, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end



