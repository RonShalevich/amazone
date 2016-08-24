class CategoriesController < ApplicationController
  @product = Product.find params[:category_id]
end
