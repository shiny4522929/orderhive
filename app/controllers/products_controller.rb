class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to  @product
      else
      render :edit, status: :unprocessable_entity
    end
  end 

  def edit
    @product = Product.find(params[:id])
  end

  def update
     @product = Product.find(params[:id])
    if @product.update(product_params)
    redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  def show
     @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path(@products)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :image, :category_id)
  end 

  def set_post
    @product = Product.find(params[:id])
  end
end
