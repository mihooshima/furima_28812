class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :pay_item, only: [:index, :create]
  # before_action :stop_direct_url_seller, only: [:index]
  # before_action :stop_direct_url_sold, only: [:index]
  # include ActiveModel::Model
  def create
    @product = Product.find(params[:product_id])

    @order = PurcheseManagementAddress.new(order_params)
     if @order.valid?
      pay_item 
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def index
    @order = PurcheseManagementAddress.new
    @product = Product.find(params[:product_id])
    return redirect_to root_path if current_user.id == @product.user_id || @product.purchese_management != nil
  end

  private
  def order_params
    params.require(:purchese_management_address).permit(:zip_code,:shipping_area,:city,:address,:building,:phone).merge(token: params[:token],user_id: current_user.id, product_id: params[:product_id])
  end

  # def order_params
  #   params.permit(:price, :token)
  # end

  def pay_item
    # Payjpという変数を利用できるようにするためには、どのファイルにどのような記述をすれば良いでしょうか？
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def stop_direct_url_seller
    redirect_to root_path if current_user.id == @product.user_id && request.referrer.nil?
  end
  def stop_direct_url_sold
    redirect_to root_path if !@product.order.nil&&request.referrer.nil?
  end
end
