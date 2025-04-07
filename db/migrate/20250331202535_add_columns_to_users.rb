class AddColumnsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :profile_picture, :string
    add_column :users, :logo, :string
    add_column :users, :description, :text
    rename_column :users, :encrypted_password, :password_digest # Renombrar la columna si es necesario
  end
end
