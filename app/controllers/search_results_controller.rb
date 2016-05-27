class SearchResultsController < ApplicationController
  def create
    SearchResult.create!(query: params[:search_query])
    redirect_to root_path
  end
end
