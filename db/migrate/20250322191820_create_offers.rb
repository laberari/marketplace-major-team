class CreateOffers < ActiveRecord::Migration[8.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.integer :user_id
      t.decimal :price

      t.timestamps
    end
  end
end
