class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, only: [:create, :edit, :destroy, :update, :new]
  PRODUCTS_PER_PAGE=10
  def new
    @product=Product.new
  end

  def create
    @product = Product.new product_params
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product), notice: 'Product Saved!'
    else
      render :new
    end
  end

  def index

    @products=Product.order(created_at: :desc).
                            page(params[:page]).
                            per(PRODUCTS_PER_PAGE)


  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
  end

  def destroy
    product=Product.find params[:id]
    product.destroy
    redirect_to products_path
  end

  def edit
    @product=Product.find params[:id]
  end
  def update
    @product = Product.find params[:id]
    if @product.update params.require(:product).permit([:title, :description, :price])
    redirect_to product_path(@product)
  else
    render :edit
  end
  end
  def product_params
    params.require(:product).permit([:title, :description, :price])
  end

 private

 def find_product
   @product = Product.find params[:id]
 end

 def find_params
   params.require(:product).permit(:title, :description, :price, :cataegory_id)
 end

end
