class SearchResultsController < ApplicationController
  def index
    if params[:search_result]
      @query = SearchResult.create(search_result_params)
      @search_results = FlickrSearch.search_for_photos(@query)
    else
      @query = SearchResult.new
      @search_results = []
    end
  end

  private

  def search_result_params
    params.require(:search_result).permit(:query)
  end
end
