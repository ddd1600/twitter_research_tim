class SearchesController < ApplicationController

  def index
  end

  def show
    search = SimpleTwitter::Search.new
    search.per_page = params[:rpp]
    search.lang = params[:lang]
    @results = search.search(params[:q])
  end
end
