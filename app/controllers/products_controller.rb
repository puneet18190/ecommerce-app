class ProductsController < ApplicationController
  before_action :set_product, only: :create
  skip_before_action :authenticate_user!, only: :index

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find params[:id]
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find params[:id]
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def order_history
    if current_user.admin?
      @order_history = Order.where("product_id is not null")
    else
      @order_history = current_user.orders
    end
  end

  private
  def set_product
    @product = Product.new(product_params)
  end

  def product_params
    params.require(:product).permit!
  end
end
