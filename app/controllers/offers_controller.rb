class OffersController < ApplicationController
    def index
      @q = Offer.ransack(params[:q]) # Inicializa Ransack para búsquedas
      @offers = @q.result(distinct: true) # Obtiene los resultados de la búsqueda
    end
  
    def show
      @offer = Offer.find(params[:id]) # Muestra los detalles de una oferta específica
    end
  end
