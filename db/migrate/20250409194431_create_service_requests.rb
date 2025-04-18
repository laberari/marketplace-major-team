class CreateServiceRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :service_requests do |t|
      t.string :title
      t.string :category
      t.text :description
      t.decimal :budget
      t.integer :user_id

      t.timestamps
    end
  end
end
