class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  # Validaciones adicionales para "Mercado Laboral"
  validates :service_type, presence: true, if: :is_labor_market?
  validates :experience_years, numericality: { greater_than_or_equal_to: 0 }, if: :is_labor_market?

  def is_labor_market?
    category.name == "Mercado Laboral"
  end
end  
