class CartedProductsController < ApplicationController
  def create
    # status = "carted" 
    carted_product = CartedProduct.new(
        user_id:current_user.id,
        product_id: params['product_id'],
        quantity: params['quantity'],
        order_id:params['order_id']
      )
  end
end
