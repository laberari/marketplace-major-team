class CreateRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.integer :user_id
      t.string :status
      t.timestamps
    end
  end
end
