class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: '#{@user.email}', subject: 'Welcome to Corgi Shark!')
  end

end
