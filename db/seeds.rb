# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

categories = [
  "Servicios de Salud",
  "Atención a la Dependencia",
  "Servicios Financieros",
  "Sector de la Vivienda",
  "Sector del Transporte",
  "Mercado Laboral",
  "Sector Educativo",
  "Servicios de Entretenimiento",
  "Digitalización",
  "Turismo",
  "Transformación Digital"
]

categories.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# Crear el usuario "Ana"
User.find_or_create_by!(email: "aquelasol1@gmail.com") do |user|
  user.name = "Ana"
  user.password = "Abeja47"
  user.profile_picture = "Personal"
  user.logo = "Personal"
  user.description = "Elaboración de Mermeladas Caseras ricas sin saborizantes ni conservantes artificiales"
end