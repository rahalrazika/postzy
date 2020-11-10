class Categorying < ApplicationRecord
  belongs_to :article
  belongs_to :category
  #scope :categories_with_articles, -> { where(role: 'categories_with_articles') }
end
