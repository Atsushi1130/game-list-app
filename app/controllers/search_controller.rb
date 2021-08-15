class SearchController < ApplicationController
  require 'json'
  require 'net/https'
  require "uri"

  def index
  end

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
    @keyword = params[:keyword]
  end

  def detail
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
    @keyword = params[:keyword]
  end
end
