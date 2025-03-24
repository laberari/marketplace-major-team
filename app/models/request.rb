class Request < ApplicationRecord
    # Relaciones con otros modelos
    belongs_to :user
    belongs_to :category
  
    # Validaciones
    validates :title, presence: true
    validates :description, presence: true, length: { maximum: 500 }
    validates :category_id, presence: true
    validates :user_id, presence: true
    validates :status, inclusion: { in: %w[open in_progress completed] }
  
    # Método para verificar si la solicitud está abierta
    def open?
      status == 'open'
    end
  
    # Método para aceptar una oferta y actualizar el estado de la solicitud
    def accept_offer(offer)
      return unless open?
  
      update(status: 'in_progress')
      offers.update_all(status: 'rejected') # Rechazar otras ofertas
      offer.update(status: 'accepted')
    end
  end
