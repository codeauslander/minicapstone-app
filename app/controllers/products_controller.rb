class ProductsController < ApplicationController
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
    render 'index.json.jbuilder'
  end
  def create
    @product = Product.new(
        name:params[:name],
        price:params[:price],
        image_url:params[:image_url],
        description:params[:description],
        in_stock:params[:in_stock]

      )
    @product.save
    if @product.save
      render 'show.json.jbuilder'
    else
      render json:{errors:@product.errors.full_messages}, status: 422
    end
    
  end
  def show
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end 
  def update
    @product = Product.find(params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.in_stock = params[:in_stock] || @product.in_stock
    @product.save
    if @product.save
      render json:@product.as_json
    else
      render json:{errors:@product.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json:{ message:"Succefully destroyed @Product ##{@product.id}."}
  end
end
