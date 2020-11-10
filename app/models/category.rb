class Category < ApplicationRecord
  has_many :categoryings, dependent: :destroy
  has_many :articles, through: :categoryings
  scope :categories_with_articles, -> { find_by(articles: :id) }

  def to_s
    name
  end
end
