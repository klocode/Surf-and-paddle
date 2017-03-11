class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @recent_posts = Post.where("id != ?", params[:id]).order(created_at: :desc).limit(5)
    render template: 'home/index.html.erb'
  end

end
