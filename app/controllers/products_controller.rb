class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
     @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :explanation, :price, :category_id, :image, :shipping_id, :shipping_cost_id,:day_id, :products_status_id).merge(user_id: current_user.id)
  end
end
