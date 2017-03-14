class PostsController < ApplicationController

  before_action :find_post, only: [:edit, :show, :update]

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
    @post = Post.new(post_params)
    if @post.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      params.require(:post).permit(:title, :body)
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end

end
