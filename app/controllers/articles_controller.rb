class ArticlesController < ApplicationController
  before_action :authenticate_user!, expect: %i[edit update new create]
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = ' Article was successfully  created'
      redirect_to article_path(@article)
    else
      flash[:alert] = 'Oups Article was not created something went wrong!!'
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = ' Article was successfully updated '
      redirect_to article_path(@article)
    else
      flash[:alert] = 'something went wrong!!'
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = 'your Article is  deleted '
    else
      flash[:alert] = 'something wrong!!'
    end
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image, :category_list)
  end
end
