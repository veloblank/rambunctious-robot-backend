class CreateGoodreadsScrapers < ActiveRecord::Migration[6.0]
  def change
    create_table :goodreads_scrapers do |t|
      t.text :search_term

      t.timestamps
    end
  end
end
