class HomeController < ApplicationController

  def index
    @post = Post.order(created_at: :desc).first
  end
end
