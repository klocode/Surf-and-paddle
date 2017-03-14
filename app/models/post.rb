class Post < ApplicationRecord
  belongs_to :user, counter_cache: true

  validates :title, :body, :user, presence: true
  validates_length_of :title, :minimum => 10

  default_scope { order(created_at: :desc) }

  paginates_per 10
end
