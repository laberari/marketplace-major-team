class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :service_type
      t.integer :experience_years
      t.boolean :is_validated

      t.timestamps
    end
  end
end
