class ProductsController < ApplicationController
  before_action : only:[:show,:destroy]
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
     @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to root_path
    else
      render'show'
    end
  end

  private

  def set_product
    @item = Item.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :explanation, :price, :category_id, :image, :shipping_id, :shipping_cost_id,:day_id, :products_status_id).merge(user_id: current_user.id)
  end
end
