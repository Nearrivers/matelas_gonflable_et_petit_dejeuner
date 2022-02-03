# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories_list = [
    "Hors du commun",
    "Appréciées",
    "Sécurité"
]

appliances_list = [
    ["Wifi", 2],
    ["Ascenseur", 2],
    ["Télévision", 2],
    ["Cuisine", 2],
    ["Lave-linge", 2],
    ["Climatisation", 2],
    ["Extincteur", 3]
]

categories_list.each do |value|
    test = Category.new( value: value)
    test.save
end

appliances_list.each do |value, category_id|
    test = Appliance.new( value: value, category_id: category_id)
    test.save
end