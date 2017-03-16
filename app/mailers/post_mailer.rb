class PostMailer < ApplicationMailer

  def share(post, send_to, user)
    @post = post
    mail(to: send_to, from: user.email, subject: "Check this stumpendous post from Corgi Shark!")
  end

end
