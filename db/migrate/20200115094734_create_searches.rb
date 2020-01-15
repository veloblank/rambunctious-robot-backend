class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :text

      t.timestamps
    end
    add_index :searches, :text
  end
end
