class PostsController < ApplicationController
  def new
    @title = params[:title]
    @post = Post.new
  end

  def create
    @title = params.require(:post).permit(:title).values[0]
    @post = Post.new(create_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/")
    else
      @post = Post.new
      render("posts/new.html.erb")
    end
  end

  def create_params
    params.require(:post).permit(:title,:review,:article,:userId)
  end

  def detail
    @post = Post.find_by(id: params[:id])
  end

  def delete
    @post = Post.find_by(id: params[:id])
    if @post
      @post.destroy
      redirect_to("/")
    end
  end
end
