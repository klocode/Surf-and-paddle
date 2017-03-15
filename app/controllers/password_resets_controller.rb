class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    flash[:info] = 'E-mail sent with password reset instructions.'
    redirect_to login_path
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hour.ago
      flash[:info] = 'Password reset has expired'
      redirect_to new_password_reset_path
    elsif @user.update(user_params)
      flash[:info] = 'Password has been reset!'
      redirect_to login_path
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:password)
    end

end
