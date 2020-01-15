class CreateReadingPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :reading_plans do |t|
      t.string :name
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
