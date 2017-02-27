class Api::ProductsController < ApplicationController
  skip_before_action :authenticate_user
  def index
    @products = Product.all
    respond_to do | format |
      format.json {render json: @products}
      format.xml  {render xml: @products }
    end
  end
  def create
    @product = Product.new(product_params)
    respond_to do | format |
      if @product.save
        format.json {render json: @product}
        format.xml  {render xml: @product }
      else
        format.json {render json: @product.errors}
        format.xml  {render xml: @product.errors }
      end
    end
  end
  def update
    @product = Product.find params[:id]
    respond_to do | format |
      if @product.update(product_params)
        format.json {render json: @product}
        format.xml  {render xml: @product }
      else
        format.json {render json: @product.errors}
        format.xml  {render xml: @product.errors }
      end
    end
  end
  def destroy
    @product = Product.find params[:id]
    @product.delete
    respond_to do | format |
      format.json {render json: {message: "Deleted succesfully"}}
      format.xml  {render xml: {message: "Deleted succesfully"}}
    end
  end
  def product_params
    params.require(:product).permit("name", "brand", "price", "product_type")
  end
end
