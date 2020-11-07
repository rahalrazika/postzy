class Category < ApplicationRecord
  has_many :categoryings dependent: :destroy
  has_many :articles, through: :categoryings
end
