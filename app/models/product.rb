class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :photo 

  # Validaciones básicas
  validates :name, presence: true
  validates :description, presence: true 
  validates :price, numericality: { greater_than: 0 }
# Validaciones adicionales para "Mercado Laboral"
  validates :service_type, presence: true, if: :is_labor_market?
  validates :experience_years, numericality: { greater_than_or_equal_to: 0 }, if: :is_labor_market?
  validates :image, content_type: ['image/jpeg', 'image/png', 'image/gif']  

  def is_labor_market?
    category&.name == "Mercado Laboral"
  end
end
