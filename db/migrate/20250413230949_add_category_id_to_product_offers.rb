class AddCategoryIdToProductOffers < ActiveRecord::Migration[8.0]
  def change
    add_column :product_offers, :category_id, :integer
  end
end
