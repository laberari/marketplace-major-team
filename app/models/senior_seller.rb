class SeniorSeller < ApplicationRecord
# Validaciones para asegurar que los campos obligatorios estén presentes
    validates :full_name, :dni_rut, :email, :phone, :biography, presence: true
    validates :dni_rut, uniqueness: true # Asegura que el DNI/RUT sea único
      
        # Relación con otros modelos (si es necesario)
    has_many :products # Relación con los productos que ofrece
    has_many :services # Relación con los servicios que ofrece
end
