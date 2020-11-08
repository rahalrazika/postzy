class HomeController < ApplicationController
  def index
    @articles = Article.all.is_most_recent
  end
end
