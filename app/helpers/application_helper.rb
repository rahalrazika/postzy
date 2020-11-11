module ApplicationHelper
  def voting(article)
    vote = Vote.find_by(author: current_user, article: article)
    if vote
      link_to('❤️', article_vote_path(id: vote.id, article_id: article.id), method: :delete)
    else
      link_to('🤍', article_votes_path(article_id: article.id), method: :post)
    end
  end
end