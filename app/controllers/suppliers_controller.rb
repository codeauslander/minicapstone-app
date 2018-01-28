class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render ''
  end
  def create
    @supplier = Supplier.new(
        name:params[:name],
        email:params[:email],
        phone_number:params[:phone_number]
      )
    @supplier.save
    if @supplier.save
      
    end
  end
  def show
    @supplier = Supplier.fin(params[:id}])
    render 'show.json.jbuilder'
  end

end
