class CreateMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :matches do |t|
      t.references :request, null: false, foreign_key: true
      t.references :product_offer, null: false, foreign_key: true
      t.string :status, default: "pending" #Estados posibles: pending, accepted, rejected

      t.timestamps
    end
  end
end
