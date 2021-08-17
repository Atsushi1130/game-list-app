class PostsController < ApplicationController
  def new
    @title = params[:title]
    @post = Post.new
  end

  def create
    Post.create(create_params)
    redirect_to("/")
  end

  private
  def create_params
    params.require(:post).permit(:title,:review,:article,:userId)
  end
end
