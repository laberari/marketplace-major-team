class Offer < ApplicationRecord
    belongs_to :category
    belongs_to :user

# Permitir atributos específicos para Ransack
def self.ransackable_attributes(auth_object = nil)
  ["title", "description", "price", "category_id", "user_id", "created_at", "updated_at"]

end
end
