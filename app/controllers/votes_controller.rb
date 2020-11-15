class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_votes
  def create
    @vote = current_user.votes.new(article_id: @article.id)
    if @vote.save
      flash[:success] = 'you voted for this article'
      redirect_to article_path(@article)
    else
      flash[:alert] = 'something went wrong'
      redirect_to root_path
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], author: current_user, article_id: @article.id)
    if vote
      vote.destroy
      flash[:success] = 'you unvoted  this article'
      redirect_to article_path(@article)
    else
      flash[:alert] = 'something went wrong'
      redirect_to root_path
    end
  end

  private

  def set_votes
    @article = Article.find(params[:article_id])
  end
end
