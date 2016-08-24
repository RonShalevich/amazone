class Review < ApplicationRecord
  belongs_to :product
  validates :star, presence: true
end
