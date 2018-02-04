class OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    # @orders = Order.all
    @orders = current_user.orders
    render 'index.json.jbuilder'
  end
  def create
    carted_products = current_user.carted_products.where(status:"carted")
   
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
    end
    tax = subtotal * 0.09
    total = tax + subtotal
    @order = Order.new(
        user_id:current_user.id,
        subtotal:subtotal,
        tax: tax,
        total: total
      )
    @order.save
    carted_products.each {|carted_product| carted_product.update(status:"purchased",order_id:@order.id)}
    render 'show.json.jbuilder'

    # subtotal = Product.find(params[:product_id]).price * params[:quantity].to_i
    # tax = subtotal * 0.09
    # total = tax + subtotal
    # @order = Order.new(
    #     user_id:current_user.id,
    #     product_id:params[:product_id],
    #     quantity:params[:quantity]
        
    #   )

    # @order.calculate_totals

    # if @order.save
    #   render 'show.json.jbuilder'
    # else
    #   render json:{errors:@order.errors.full_messages},status:422
    # end
  end
end
  