class CreateSeniorSellers < ActiveRecord::Migration[8.0]
  def change
    create_table :senior_sellers do |t|
      t.string :full_name
      t.string :dni_rut
      t.string :email
      t.string :phone
      t.text :biography
      t.string :certifications
      t.text :references
      t.string :status

      t.timestamps
    end
  end
end
