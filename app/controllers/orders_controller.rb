class OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    # @orders = Order.all
    @orders = current_user.orders
    render 'index.json.jbuilder'
  end
  def create
    subtotal = Product.find(params[:product_id]).price * params[:quantity].to_i
    tax = subtotal * 0.09
    total = tax + subtotal
    @order = Order.new(
        user_id:current_user.id,
        product_id:params[:product_id],
        quantity:params[:quantity]
        
      )

    @order.calculate_totals

    if @order.save
      render 'show.json.jbuilder'
    else
      render json:{errors:@order.errors.full_messages},status:422
    end
  end
end
  