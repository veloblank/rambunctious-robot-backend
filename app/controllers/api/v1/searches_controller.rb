class Api::V1::SearchesController < ApplicationController

  def index
    searches = Search.all
    render json: searches, status: 200
  end
  
  def create
    search = Search.create(search_params)
    scraper = GoodreadsScraper.new(searchTerm: params[:text])
    books = scraper.scrape_goodreads_for_book
    render json: search, include: [:book]
  end

  def destroy
    search = Search.find(params[:id])
    search.delete
    render json: {searchId: search.id}
  end

  private 

  def search_params
    params.require(:search).permit(:text)
  end

end

