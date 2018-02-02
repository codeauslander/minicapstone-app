class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create,:update,:destroy]
  before_action :authenticate_admin, except: [:index,:show,:all_products_method,:first_product_method]
  def all_products_method
    products = Product.all
    render json:products.as_json
  end
  def first_product_method
    first_product = Product.first 
    render json:first_product.as_json
  end
  def index
    @products = Product.all 
    search = params[:search]
    sort = params[:sort]
    if search
      @products = @products.where("name iLIKE ?","%#{search}%")
    end
    if sort
      @products = @products.order(sort => :asc)
    end
    category_name = params[:category]
    if category_name
      @products = Category.find_by(name:category_name).products
    end
    render 'index.json.jbuilder'
  end
  def create
    # if current_user && current_user.admin
      @product = Product.new(
        name:params[:name],
        price:params[:price],
        description:params[:description],
        in_stock:params[:in_stock],
        supplier_id: params[:supplier_id]

      )
      if @product.save
        render 'show.json.jbuilder'
      else
        render json:{errors:@product.errors.full_messages}, status: 422
      end
    # else
    #   render json: {message, "you are not authorized"}, status: :unauthorized
    #   # 401 unauthorized status
    # end
  end
  def show
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end 
  def update
    # if current_user && current_user.admin
      @product = Product.find(params[:id])
      @product.name = params[:name] || @product.name
      @product.price = params[:price] || @product.price
      @product.description = params[:description] || @product.description
      @product.in_stock = params[:in_stock] || @product.in_stock
      if @product.save
        render 'show.json.jbuilder'
      else
        render json:{errors:@product.errors.full_messages}, status: :unprocessable_entity
      end
    # else
    #   render json: {message, "You are not authorized"},status: 401
    # end
    
  end
  def destroy
    # if current_user && current_user.admin
      @product = Product.find(params[:id])
      @product.destroy
      render json:{ message:"Succefully destroyed product ##{@product.id}."}
    # else
    #   render json: {message, "You are not authorized",status: :unauthorized}
    # end
    
  end
end
