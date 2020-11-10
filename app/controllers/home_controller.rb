class HomeController < ApplicationController
  def index
    @articles = Article.all.is_most_recent
    @category = Category.all.categories_with_articles
    @array = []
    Article.all.each { |article| @array << article.votes }
    @votes_array = []
    @array.each { |vote| @votes_array << vote.count }
    @most_voted = @votes_array.max(1).first
  end
end
