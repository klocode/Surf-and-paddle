class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @popular_posts = Post.where("id != ?", params[:id]).order(created_at: :desc).limit(4)
    render 'home/index'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to :root
    else
      render :new
    end

  end

  private

  def post_params
    params.require(:post).permit(:user_id, :body)
  end

end
