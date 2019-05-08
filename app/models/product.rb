class Product < ApplicationRecord
  def index

  end

  def show
    @product = Product.find(params[:id])
  end
end
