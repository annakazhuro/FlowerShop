class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    new_params = product_params
    puts new_params.except(:category_id, :subcategory_id)
    @product = Product.new(new_params.except(:category_id, :subcategory_id))

    puts @product
    respond_to do |format|
      if @product.save
        ProductSubcategory.create!(new_params.slice(:category_id, :subcategory_id).merge(product_id: @product.id))
        format.html { redirect_to @product}
        format.js
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    ProductSubcategory.find_by_product_id(@product.id).destroy
    @product.destroy
    respond_to do |format|
      format.html { }
      format.js
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:id, :title, :price, :description, :category_id, :subcategory_id, :available, :image_url)
  end
end
