class PostsController < ApplicationController
  def new
    @aipId = params[:aipId]
    data = {
      "aipId": @aipId
    }
    query = data.to_query
    uri = URI.parse("https://mediaarts-db.bunka.go.jp/api/search?fieldId=game&categoryId=gm-item&subcategoryId=gm301&sort=date&"+query)
    http = Net::HTTP.new(uri.host,uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri)
    res = http.request(req)
    @res_data = JSON.parse(res.body)
    @title = @res_data["record"][0]["metadata"]["schema:name"][0]
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
    params.require(:post).permit(:title,:aipId,:review,:article,:userId)
  end

  def detail
    @post = Post.find_by(id: params[:id])
    @likes_count = Like.where(postId: @post.id).count
  end

  def delete
    @post = Post.find_by(id: params[:id])
    if @post
      @post.destroy
      redirect_to("/")
    end
  end
end
