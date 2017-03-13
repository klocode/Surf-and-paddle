class User < ApplicationRecord
  has_many :posts

  validates :name, :picture, presence: true
  validates :name, uniqueness: true
end
