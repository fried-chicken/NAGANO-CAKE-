class Public::OrdersController < ApplicationController
  before_action :cartitem_nill,   only: [:new, :create]
  before_action :order_new, only: [:confirm]

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = current_customer.addresses
  end

  def confirm
     @shipping_fee = 800
     @order = Order.new(order_params)

    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end

      @cart_items = current_customer.cart_items
      @order_new = Order.new

      render :confirm
  end

  def create
    order = Order.new(order_params)
    order.save
      @cart_items = current_customer.cart_items.all

        @cart_items.each do |cart_item|
          @order_details = OrderDetail.new
          @order_details.order_id = order.id
          @order_details.item_id = cart_item.item.id
          @order_details.price = cart_item.item.price
          @order_details.amount = cart_item.amount
          @order_details.making_status = 0
          @order_details.save!
        end

        CartItem.destroy_all
        redirect_to orders_thanks_path

  end

  def thanks
  end

  def index
    @orders = current_customer.orders.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_fee, :total_price, :customer_id, :status)
  end

  def cartitem_nill
     cart_items = current_customer.cart_items
     if cart_items.blank?
      redirect_to cart_items_path
     end
  end

  def order_new
    if params[:order][:select_address] == "2"
      if params[:order][:postal_code] == "" || params[:order][:address] == "" || params[:order][:name] == ""
        redirect_back(fallback_location: root_path)
      end
    end
  end

end
