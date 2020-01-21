class GoodreadsScraper < ApplicationRecord
  require 'open-uri'

  GOODREADS = "https://www.goodreads.com/search?utf8=%E2%9C%93&query="
  GOODREADS_BASE = "https://goodreads.com"
  
  def sanitize_search_term
    search_term.split(' ').join('+')
  end
  
  def scrape_goodreads_for_book
    doc = Nokogiri::HTML(open(GOODREADS + "#{self.search_term}"))
    goodreads_partial = doc.css(".leftContainer table tr")[0].css("td a").attribute("href").value
    goodreads_book_link = GOODREADS_BASE + goodreads_partial
    doc2 = Nokogiri::HTML(open(goodreads_book_link))
    
    book_title = doc.css(".leftContainer table tr")[0].css("td a").attribute("title").value
    book_author =doc2.css("a.authorName span").text
    compressed_img_src = doc.css(".leftContainer table tr")[0].css("td a img").attribute("src").value
    large_img_src = doc2.css(".bookCoverPrimary a img").attribute('src').value
    num_pages = doc2.css("div#details .row").css("span")[1].text.split(' ')[0].to_i
    num_words_low = num_pages * 250
    num_words_high = num_pages * 295
    book_hash = {
      title: book_title,
      author: book_author,
      compressed_img: compressed_img_src,
      large_img: large_img_src,
      pages: num_pages,
      words_low: num_words_low,
      words_high: num_words_high,
      search_id: Search.find_by(text: self.search_term).id
    }
  end
end