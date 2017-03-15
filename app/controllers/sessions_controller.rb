class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.name}!"
      redirect_to :root
    else
      flash[:danger] = "Incorrect credentials. Please try again."
      redirect_to :login
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully!"
    redirect_to :root
  end

end
