class ProductOffersController < ApplicationController
        def index
          @product_offers = ProductOffer.all
        end
      
        def new
          @product_offer = ProductOffer.new
        end
        
        def show
          @product_offer = ProductOffer.find(params[:id])
        end 


        def create
          @product_offer = ProductOffer.new(product_offer_params)
          if @product_offer.save
            redirect_to product_offers_path, notice: "Oferta creada exitosamente."
          else
            render :new
          end
        end
      
        private
      
        def product_offer_params
          params.require(:product_offer).permit(:title, :description, :category_id, :price, :photo, :experience_years)
        end
      end
