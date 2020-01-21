class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :compressed_img
      t.string :large_img
      t.integer :pages
      t.integer :words_low
      t.integer :words_high
      t.integer :search_id

      t.timestamps
    end
  end
end
