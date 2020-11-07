class CategoriesController < ApplicationController
  def index 
     @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles 
  end

  def new 
    @category = Category.new 
  end
  def create
    @category = current_user.categorys.build(category_params)
    if @category.save
      flash[:success] = 'your category is created'
      redirect_to category_path(@category)
    else
      flash[:alert] = 'Something wrong!!'
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = 'your category is  updated '
      redirect_to category_path(@category)
    else
      flash[:alert] = 'something wrong!!'
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = 'your category is  deleted '
    else
      flash[:alert] = 'something wrong!!'
    end
    redirect_to root_path
  end
  private
  def category_params
    params.require(:category).permit(:name)
  end
end
