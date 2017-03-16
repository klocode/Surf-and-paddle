class Post < ApplicationRecord
  belongs_to :user, counter_cache: true

  mount_uploader :photo, PostPhotoUploader

  validate :has_photo
  validates :title, :body, :user, presence: true
  validates_length_of :title, {:minimum => 10, message: -> (object, chars) do
                          "is #{(10 - chars[:value].length)} characters too short."
                        end}


  default_scope { order(created_at: :desc) }

  paginates_per 10

  def is_owner?(this_user)
    user == this_user
  end

  # def image(version = :standard)
  #   if photo?
  #     photo.versions[version].url
  #   elsif !picture_url.blank?
  #     picture_url
  #   else
  #     "No image"
  #   end



  def has_photo
    if !photo? && photo_url.blank?
      errors[:base] = "Must upload a photo or a photo url."
    end
  end

end
