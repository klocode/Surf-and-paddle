class UsersController < ApplicationController

  before_action :find_user, only: [:edit, :show, :update]
  before_action :require_user, only: [:edit, :update]
  before_action :require_self, only: [:edit, :update]


  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup(@user).deliver
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :bio, :password, :picture, :email)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def require_self
    unless @user == current_user
      flash[:danger] = "Swiper no swiping."
      redirect_to :root
    end
  end


end
