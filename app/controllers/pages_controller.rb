class PagesController < ApplicationController
  def home
  	access_token = ENV["16101639.80fea2a.123f2c80f483496f9cfb48d63f897caf"]
    client = Instagram.client(access_token: access_token)
    default_search = client.tag_search('skimmlife')

    if params[:q]
      search_query = client.tag_search(params[:q])
      @tag = search_query.present? ? search_query : default_search
    else
      @tag  = default_search
    end

    @tag = @tag.first.name
    @search = client.tag_recent_media(@tag)
  end

  def about
  end
  
end