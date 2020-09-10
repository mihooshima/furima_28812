class ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :explanation, :price, :category_id, :image, :cost_id, :shipping_id, :day_id, :products_status_id).merge(user_id: current_user.id)
  end
end