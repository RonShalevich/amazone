# class Product < ApplicationRecord
#
#   validates :title, presence: true, uniqueness: true
#   validates :description, presence: true, length:{minimum: 10}
#   # validates :price, numericality:{minimum: 0}
# after_initialize :set_default
# before_validation :capitalize_title
#
# def self.search(keyword)
#     where(["title ILIKE ?", "%#{keyword}%"]) +
#     where(["description ILIKE ?", "%#{keyword}%"])
#
# end
#
#
# private
#
#   def capitalize_title
#     self.title.capitalize! if title
#   end
#
#   def set_default
#     self.price ||=1
#   end
#
# end
class Product < ApplicationRecord

  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, presence: true

  def titleized_title
    title.titleize
  end

end
