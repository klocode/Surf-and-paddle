class Post < ApplicationRecord
  belongs_to :user, counter_cache: true

  mount_uploader :photo, PostPhotoUploader

  validate :url_xor_photo
  validates :title, :body, :user, presence: true
  validates_length_of :title, {:minimum => 10, message: -> (object, chars) do
                          "Your post title is #{(10 - chars[:value].length)} characters too short."
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



  # def url_xor_photo
  #   if !photo? && photo_url.blank?
  #     errors.add(:photo, "must exist if photo url doesn't")
  #     errors.add(:photo_url, "must exist if photo doesn't")
  #   end
  # end

end
