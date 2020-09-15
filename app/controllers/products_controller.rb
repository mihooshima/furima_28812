class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :create]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, except:[:index]
  
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

  def edit
    if @product.user_id != current_user.id
      redirect_to action :index
    end
  end

  def show
     @product = Product.find(params[:id])
  end
 
  def update
    if @product.update(product_params)
        redirect_to product_path
    else
     render'edit'
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :explanation, :price, :category_id, :image, :shipping_id, :shipping_cost_id,:day_id, :products_status_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
 
  def set_item
    @product = Product.find(params[:id])
  end
 end

 