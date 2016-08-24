class ReviewsController < ApplicationController


  def create
      @product=Product.find params[:product_id]
      review_params = params.require(:review).permit(:body, :star)
      @review = Review.new review_params
      @review.product = @product
      if @review.save
      redirect_to product_path(@product), notice: 'Review created!'
    else
      flash[:alert] = 'Please fix errors below'
      render 'products/show'
    end
  end

  def destroy
    pr=Product.find params[:product_id]
    re = Review.find params[:id]
    re.destroy
    redirect_to product_path(pr), notice: 'Review deleted'
  end
end
