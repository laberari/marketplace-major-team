class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product_offer = ProductOffer.new
  end

def index 
  @products = Product.all   #Cargar los productos desde la base de datos  
end

  def create
    Rails.logger.debug("Product Params: #{product_params.inspect}")
    @product_offer = ProductOffer.new(product_offer_params)
    if @product_offer.save
      redirect_to @product_offer, notice: "Producto creado exitosamente."
    else
      flash.now[:alert] = "Error al guardar el Producto: #{@product.errors.full_messages.join(', ')}"
      render :new
    end
  end
  

  def show
    # Muestra los detalles de un producto específico
  end

  def edit
    # Permite editar un producto existente
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Producto actualizado exitosamente." 
    else
      render :edit
    end
  end 

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Producto eliminado exitosamente."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_offer_params
    params.require(:product_offer).permit(:name, :description, :price, :image, :category_id, :service_type, :experience_years, :is_validated)
  end
end
 
