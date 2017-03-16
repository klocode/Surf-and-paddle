class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Corgi Shark!')
  end

  def forgot_password(user)
    @user = user
    @greeting = "Why hello there,"

    mail to: user.email, :subject => 'Reset password instructions'
  end

end
