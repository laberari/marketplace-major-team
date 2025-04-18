# Este archivo asegura la existencia de registros necesarios para ejecutar la aplicación en todos los entornos.
# El código aquí debe ser idempotente para que pueda ejecutarse en cualquier momento.
# Los datos pueden cargarse con el comando `bin/rails db:seed` o creados junto con la base de datos usando `db:setup`.

# Crear categorías
categories = [
  "Salud",
  "Atención a la Dependencia",
  "Financiero",
  "Vivienda",
  "Transporte",
  "Mercado Laboral",
  "Educación",
  "Entretenimiento",
  "Digitalización",
  "Turismo",
  "Transformación Digital"
]

categories.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# Crear usuarios
users = [
  {
    email: "aquelasol1@gmail.com",
    name: "Ana",
    password: "Abeja47",
    profile_picture: "Personal",
    logo: "Personal",
    description: "Elaboración de Mermeladas Caseras ricas sin saborizantes ni conservantes artificiales"
  },
  {
    email: "juan@example.com",
    name: "Juan",
    password: "Password123",
    profile_picture: "Personal",
    logo: "Personal",
    description: "Carpintería personalizada para muebles de hogar"
  }
]

users.each do |user_attrs|
  User.find_or_create_by!(email: user_attrs[:email]) do |user|
    user.name = user_attrs[:name]
    user.password = user_attrs[:password]
    user.profile_picture = user_attrs[:profile_picture]
    user.logo = user_attrs[:logo]
    user.description = user_attrs[:description]
  end
end

# Crear productos con fotos
products = [
  {
    title: "Mermelada de Frutilla",
    description: "Deliciosa mermelada casera hecha con frutillas frescas.",
    price: 5000,
    category_name: "Salud",
    user_email: "aquelasol1@gmail.com",
    photo_path: Rails.root.join("app/assets/images/mermelada_frutilla.jpg")
  },
  {
    title: "Mesa de Comedor",
    description: "Mesa de comedor artesanal hecha a medida.",
    price: 150000,
    category_name: "Vivienda",
    user_email: "juan@example.com",
    photo_path: Rails.root.join("app/assets/images/mesa_comedor.jpg")
  }
]

products.each do |product_attrs|
  user = User.find_by(email: product_attrs[:user_email])
  category = Category.find_by(name: product_attrs[:category_name])

  ProductOffer.find_or_create_by!(title: product_attrs[:title]) do |product|
    product.user = user
    product.category = category
    product.description = product_attrs[:description]
    product.price = product_attrs[:price]
    product.photo.attach(io: File.open(product_attrs[:photo_path]), filename: File.basename(product_attrs[:photo_path]))
  end
end