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
    uri = URI.parse("https://mediaarts-db.bunka.go.jp/api/search?fieldId=game&categoryId=gm-col&subcategoryId=gm305&sort=date&"+query)
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
    uri = URI.parse("https://mediaarts-db.bunka.go.jp/api/search?fieldId=game&categoryId=gm-col&subcategoryId=gm305&sort=date&"+query)
    http = Net::HTTP.new(uri.host,uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri)
    res = http.request(req)
    @res_data = JSON.parse(res.body)
    @keyword = params[:keyword]
    @game306Data = nil
    @colResData = nil
    if @res_data["record"][0]["metadata"]["ma:variationOf"]
      @game306Data = @res_data["record"][0]["metadata"]["ma:variationOf"][0]
      colUri = URI.parse(@game306Data)
      colHttp = Net::HTTP.new(colUri.host,colUri.port)
      colHttp.use_ssl = true
      colReq = Net::HTTP::Get.new(colUri)
      colRes = colHttp.request(colReq)
      @colResData = JSON.parse(colRes.body)
    end
  end
end
