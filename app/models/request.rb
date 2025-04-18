class Request < ApplicationRecord
    # Relaciones con otros modelos
    belongs_to :user
    belongs_to :category
    has_many :offers, dependent: :destroy #Relación con el Modelo Offer 
    has_many :matches, dependent: :destroy #Relación con el Match 
  
    # Validaciones
    validates :title, presence: true
    validates :description, presence: true, length: { maximum: 500 }
    validates :category_id, presence: true
    validates :user_id, presence: true
    validates :status, inclusion: { in: %w[open in_progress completed] }, presence: true 
    validates :details, presence: true 

    #Asignar estado predeterminado 
    after_initialize :set_default_status, if: :new_record? 
  
    # Método para verificar si la solicitud está abierta
    def open?
      status == 'open'
    end
  
    # Método para aceptar una oferta y actualizar el estado de la solicitud
    def accept_offer(offer)
      return unless open?


     ActiveRecord::Base.transaction do  
      update!(status: 'in_progress')
      offers.update_all(status: 'rejected') # Rechazar otras ofertas
      offer.update(status: 'accepted')
    end
  rescue ActiveRecord::RecordInvalid => e 
    errors.add(:base, "Error al aceptar la oferta: #{e.message}")
    false
  end

  private 

  def set_default_status
    self.status ||= 'open'
  end
end