class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categoryings, dependent: :destroy
  has_many :categories, through: :categoryings
  has_many :votes, dependent: :destroy
  has_attached_file :image, presence: true
  validates :title, presence: true, length: { in: 3..20 }
  validates :content, presence: true, length: { maximum: 140 }
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  scope :is_most_recent, -> { order(created_at: :desc) }

  def category_list
    categories.collect(&:name).join(', ')
  end

  def category_list=(categories_string)
    category_names = categories_string.split(',').collect { |s| s.strip.downcase }.uniq
    new_or_found_categories = category_names.collect { |name| Category.find_or_create_by(name: name) }
    self.categories = new_or_found_categories
  end
end
