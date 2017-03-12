class HomeController < ApplicationController

  def index
    @post = Post.order(created_at: :desc).first
    @popular_posts = Post.order(created_at: :desc).offset(1).limit(4)
    @user = @post.user
  end

end
