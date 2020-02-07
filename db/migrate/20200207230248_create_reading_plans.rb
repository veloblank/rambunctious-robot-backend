class CreateReadingPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :reading_plans do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
