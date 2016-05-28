class SearchResultsController < ApplicationController
  def index
    if params[:query]
      @query = SearchResult.new(query: params[:query])
      if @query.save
        @search_results = FlickrSearch.search_for_photos(@query)
      else
        @search_results = []
      end
    else
      @query = SearchResult.new
      @search_results = []
    end
  end

end
