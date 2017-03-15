class User < ApplicationRecord
  has_many :posts
  has_secure_password

  validates :name, :picture, :email, presence: true
  validates :name, uniqueness: true

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.forgot_password(self).deliver
  end
  # This generates a random password reset token for the user
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
  def to_s
    name
  end

end
