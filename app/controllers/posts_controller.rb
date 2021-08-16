class PostsController < ApplicationController
  def new
    @title = params[:title]
    data = {
      "name": @title,
    }
    query = data.to_query
    uri = URI.parse("https://mediaarts-db.bunka.go.jp/api/search?fieldId=game&categoryId=gm-item&subcategoryId=gm301&sort=date&"+query)
    http = Net::HTTP.new(uri.host,uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri)
    res = http.request(req)
    @res_data = JSON.parse(res.body)
  end
end
