class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, length: {
    minimum: 20,
    maximum: 150
  }

  # has_many :likes
end
