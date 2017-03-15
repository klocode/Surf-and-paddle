class Post < ApplicationRecord
  belongs_to :user, counter_cache: true

  mount_uploader :photo, PostPhotoUploader


  validates :title, :body, :user, presence: true
  validates_length_of :title, :minimum => 10

  default_scope { order(created_at: :desc) }

  paginates_per 10

  def is_owner?(this_user)
    user == this_user
  end

end
