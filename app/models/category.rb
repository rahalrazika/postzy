class Category < ApplicationRecord
  has_many :categoryings, dependent: :destroy
  has_many :articles, through: :categoryings
  validates :name, presence: true, length: { in: 3..20 }

  def to_s
    name
  end

  
end
