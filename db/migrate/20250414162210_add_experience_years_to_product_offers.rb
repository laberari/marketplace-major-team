class AddExperienceYearsToProductOffers < ActiveRecord::Migration[8.0]
  def change
    add_column :product_offers, :experience_years, :integer
  end
end
