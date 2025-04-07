class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

def index 
  @products = Product.all 
  # Acción para mostrar la lista de productos 
end

  def create
    Rails.logger.debug("Product Params: #{product_params.inspect}")
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Producto creado exitosamente."
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

  def product_params
    params.require(:product).permit(:name, :description, :price, :image, :category_id, :service_type, :experience_years, :is_validated)
  end
end
 
