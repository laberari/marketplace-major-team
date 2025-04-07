class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name 
      t.integer :age # Opcional: Mantener esta columna si es relevante para tu proyecto
      t.string :email, null: false, index: { unique: true } # Correo electrónico único
      t.string :password_digest # Cambiar 'encrypted_password' por 'password_digest'
      t.string :profile_picture # Foto de perfil
      t.string :logo # Logo del usuario
      t.text :description # Descripción del usuario

      t.timestamps
    end
  end
end
