class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render :show
    else
      render :new
    end
  end

  def update
    @product.update_attributes(product_params)
    render :show
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

    def find_product
      @product = Product.find(params[:id])
    end

    def product_params
        params.require(:product).permit(:name, :price, :ingredient_ids => [])
    end

end