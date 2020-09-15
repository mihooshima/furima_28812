class ProductsController < ApplicationController
  before_action :set_product ,only:[:show,:destroy]
  def index
    @products = Product.all.order(created_at: :desc)
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
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render'show'
    end
  end

  private

  def set_product
    @product = Poduct.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :explanation, :price, :category_id, :image, :shipping_id, :shipping_cost_id,:day_id, :products_status_id).merge(user_id: current_user.id)
  end
end
