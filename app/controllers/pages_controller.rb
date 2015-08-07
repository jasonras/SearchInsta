class PagesController < ApplicationController
  def home
    # %w() creates an array of strings, split by white space
    @tags = %w( skimmlife
                theskimm
                refresh
                WaiterOrWaitress
                AtTheGym
                WithAPet
                Neighbor
                Register
                FreeSkimm)

  	access_token = ENV["CONFIG.ACCESS_TOKEN"]
    client = Instagram.client(access_token: access_token)
    default_search = client.tag_search('skimmlife')

    if params[:q].present?
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