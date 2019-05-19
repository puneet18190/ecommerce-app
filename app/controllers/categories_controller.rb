class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action  :user_is_admin, only: %i[new create edit]

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
      flash[:success] = 'Category was successfully created.'
    else
      render :new
    end
  end

  def show
    @category = Category.search_filter(params[:category_id], params[:price])
    @order_item = current_order.order_items.new
    respond_to do | format |
      format.html {}
      format.js {}
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
