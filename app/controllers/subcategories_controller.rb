class SubcategoriesController < ApplicationController
  def show
    @product_subcategory = ProductSubcategory.where(subcategory_id: params[:id])
    @products = Product.where(id: @product_subcategory.map(&:product_id))
  end
end