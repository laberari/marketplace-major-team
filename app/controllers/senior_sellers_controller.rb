class SeniorSellersController < ApplicationController
    def new
      @senior_seller = SeniorSeller.new
    end
  
    def create
      @senior_seller = SeniorSeller.new(senior_seller_params)
      if @senior_seller.save
        redirect_to thank_you_path, notice: "Tu solicitud ha sido enviada. Pronto recibirás una respuesta."
      else
        render :new
      end
    end
  
    private
  
    def senior_seller_params
      params.require(:senior_seller).permit(:full_name, :dni_rut, :email, :phone, :biography, :certifications, :references)
    end
  end 