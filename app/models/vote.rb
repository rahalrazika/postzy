class Vote < ApplicationRecord
  belongs_to :article
  belongs_to :author, class_name: 'User'
  validates :author_id, uniqueness: { scope: :article_id }
end
