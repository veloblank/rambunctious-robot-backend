class Api::V1::SearchesController < ApplicationController

  def index
    searches = Search.all
    render json: searches, status: 200
  end
  
  def create
    search = Search.create(search_params)
    scraper = GoodreadsScraper.new(search_term: params[:text])
    scraper.sanitize_search_term
    book_html = scraper.scrape_goodreads_for_book
    book = Book.create(book_html)
    book.search = search
    render json: book, status: 200
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

