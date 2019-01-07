class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
    #implicit new render
  end

  def show
  end
  def create
    @product = Product.create(product_params)
    if @product.valid?
      redirect_to @product
    else
      @errors = @product.errors.full_messages
      render :edit
    end
  end
  private
  ###private methods
  def product_params
    params.require(:product).permit(:name, :test_id, :system_id, :search)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
