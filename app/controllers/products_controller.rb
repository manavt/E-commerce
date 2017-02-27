require 'csv'
class ProductsController < ApplicationController
  include DownloadFile
  before_action :check_object, only: :show
  def check_object
    puts "I am here , here "
    @product = Product.find params[:id] rescue nil
    if @product.nil?

      redirect_to products_path
      flash[:notice] = "<b style=color:red;>Wrong object id placed</b>"
    end

  end

  def index
    @product = Product.paginate(page: params[:page], per_page: 5)
  end

  def new
    @product = Product.new
  end
  def create
    image_attributes = params[:product][:image]
    params[:product].delete(:image)
    # params is stron paramtere in rails , which collects the user input from browser
    @product = Product.new(product_params)
    if @product.save
      image_attributes[:photo].each do | image |
         img = Image.new(photo: image, entity: @product)
         img.save(validate: false)
      end
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find params[:id]
  end
  def update
    # params is stron paramtere in rails , which collects the user input from browser
    @product = Product.find params[:id]
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end
  def show
    @product = Product.find params[:id]
  end
  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to products_path
  end

  def in_json
    FileUtils.mkdir_p "#{Rails.root}/public/JSON"
    filepath = "#{Rails.root}/public/JSON/export_in_json.json"
    product = Product.includes(:images)
    record = product.collect { |p|
      [
        p.name,
        p.brand,
        p.product_type,
        p.price,
        (p.images.collect {|im|
          im.photo.path
          } if p.images.present?)
          ]
        }
    File.open(filepath, "w") { | foo |
      foo.write(record.to_json)
    }
    send_file filepath, disposition: :attachment
  end
  protected
  def product_params
    params.require(:product).permit!
  end
end
