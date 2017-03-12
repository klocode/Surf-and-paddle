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

end
