class PagesController < ApplicationController
  def index
    @search_history = SearchResult.all || []
  end
end
