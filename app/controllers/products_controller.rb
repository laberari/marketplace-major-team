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
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Producto creado exitosamente."
    else
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
    redirect_to categories_path, notice: "Producto eliminado exitosamente."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :service_type, :experience_years, :is_validated)
  end
end
