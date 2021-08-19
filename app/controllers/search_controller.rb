class SearchController < ApplicationController
  require 'json'
  require 'net/https'
  require "uri"

  def search
    data = {
      "q": params[:keyword],
      "sort": "title",
      "limit": "1000",
    }
    query = data.to_query
    uri = URI.parse("https://mediaarts-db.bunka.go.jp/api/search?fieldId=game&categoryId=gm-item&subcategoryId=gm301&sort=date&"+query)
    http = Net::HTTP.new(uri.host,uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri)
    res = http.request(req)
    @res_data = JSON.parse(res.body)
    @res_data = @res_data["record"]
    @res_data = Kaminari.paginate_array(@res_data).page(params[:page]).per(10)
    @keyword = params[:keyword]
  end

  def detail
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
    @keyword = params[:keyword]
  end
end
