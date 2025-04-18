class CreateProductOffers < ActiveRecord::Migration[8.0]
  def change
    create_table :product_offers do |t|
      t.string :title
      t.string :category
      t.text :description
      t.decimal :price
      t.integer :user_id

      t.timestamps
    end
  end
end
