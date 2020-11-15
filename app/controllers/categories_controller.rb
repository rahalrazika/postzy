class CategoriesController < ApplicationController
  before_action :authenticate_user!, expect: %i[edit update new create]
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show; end

  def edit; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'category was successfully created'
      redirect_to category_path(@category)
    else
      flash[:alert] = 'Oups Category was not created!!'
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = ' Category was successfully updated '
      redirect_to category_path(@category)
    else
      flash[:alert] = ' something went  wrong!!'
      render 'edit'
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = ' Category was successfully deleted '
    else
      flash[:alert] = 'something wrong!!'
    end
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
