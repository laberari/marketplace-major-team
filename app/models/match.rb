class Match < ApplicationRecord
  belongs_to :request
  belongs_to :product_offer

  #Validaciones básicas
  validates :status, inclusion: { in: %w[pending accepted rejected] }

end
