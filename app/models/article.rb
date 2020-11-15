class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categoryings, dependent: :destroy
  has_many :categories, through: :categoryings
  has_many :votes, dependent: :destroy
  has_attached_file :image,
                    storage: :cloudinary,
                    path: ':class/:id/:style/:filename'

  validates :title, presence: true, length: { minimum: 4 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  validates_attachment_presence :image

  def category_list
    categories.collect(&:name).join(', ')
  end

  def category_list=(categories_string)
    category_names = categories_string.split(',').collect { |s| s.strip.downcase }.uniq
    new_or_found_categories = category_names.collect { |name| Category.find_or_create_by(name: name) }
    self.categories = new_or_found_categories
  end
end
