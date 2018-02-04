class CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.carted_products.where(status:"carted")
    # @carted_products = CartedProduct.where(status:"carted",user_id:current_user.id)
    # @carted_products = CartedProduct.where('user_id = ?',"#{current_user.id}")
    # @carted_products = CartedProduct.where(status:"carted")
    # render json:@carted_products.as_json
     render 'index.json.jbuilder'
  end
  def create
    status = "carted" 
    @carted_product = CartedProduct.new(
        user_id:current_user.id,
        product_id: params['product_id'],
        quantity: params['quantity'],
        order_id:params['order_id'],
        status:status
      )
    if @carted_product.save
      # render 'show.json.jbuilder'
      # render json:@carted_product.as_json
      render 'show.json.jbuilder'
    else
      render json:{errors:@carted_product.errors.full_messages},status:422
    end
  end
end
