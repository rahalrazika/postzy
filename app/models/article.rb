class Article < ApplicationRecord
  belongs_to :user
  has_many :categoryings dependent: :destroy
  has_many :categories, through: :categorying
  has_many :votes, dependent: :destroy
  validates :title, presence: true,  length: {in: 3..20}
  validates :content, presence: true,  length: {maximum: 140}
  scope :by_most_recent, -> {order(created_at: :desc)} 

end
