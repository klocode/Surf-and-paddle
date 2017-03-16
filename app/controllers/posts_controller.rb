class PostsController < ApplicationController

  before_action :find_post, only: [:edit, :show, :update, :share, :send_to]
  before_action :require_user, only: [:new, :edit, :create, :share, :send_to]
  before_action :is_owner, only: [:edit, :update, :destroy]
  # make destroy

  def index
    @posts = Post.page(params[:page])
  end

  def show
    @user = @post.user
    @popular_posts = Post.where("id != ?", params[:id]).order(created_at: :desc).limit(4)
    render 'home/index'
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    flash[:success] = "You have deleted post: #{@post.title}."
    redirect_to :root
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      params.require(:post).permit(:title, :body)
    end
  end

  def share
  end

  def send_to
    @send_to = params[:share][:send_to]
    PostMailer.share(@post, @send_to, current_user).deliver
    flash[:success] = "Post has been successfully shared!"
    redirect_to @post
  end

  def find_post
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :photo, :photo_url)
  end

  def is_owner
    @post = Post.find_by(id: params[:id])
    unless current_user.admin or @post.user == current_user
      flash[:danger] = "That's not your post."
      redirect_to :root
    end
  end

end
