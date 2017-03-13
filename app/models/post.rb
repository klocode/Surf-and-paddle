class Post < ApplicationRecord
  belongs_to :user, counter_cache: true

  validates :title, :body, :user, presence: true
end
