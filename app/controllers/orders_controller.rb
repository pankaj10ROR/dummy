class OrdersController < ApplicationController
  before_action :require_login
  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def new
    @order = current_customer.orders.new
  end


  def create
    @order = current_customer.orders.new(order_params)
    @order.pay_methed = @current_cart.sub_total
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to new_order_charge_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_methed, :mobile, :pin_code, :city, :state, :status)
  end

  private
  def require_login
    unless current_customer
      redirect_to customer_session_path
    end
  end
end
