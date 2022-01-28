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
    ["Piscine", 1],
    ["Jacuzzi", 1],
    ["Patio", 1],
    ["Barbecue", 1],
    ["Brasero", 1],
    ["Billard", 1],
    ["Cheminée", 1],
    ["Espace repas en plein air", 1],
    ["Appareils de fitness", 1],
    ["Wifi", 2],
    ["Télévision", 2],
    ["Cuisine", 2],
    ["Lave-linge", 2],
    ["Parking gratuit sur place", 2],
    ["Parking payant sur place", 2],
    ["Climatisation", 2],
    ["Espace de travail dédié", 2],
    ["Douche extérieure", 2],
    ["Détecteur de fumée", 3],
    ["Kit de premiers secours", 3],
    ["Détecteur de monoxyde de carbone", 3],
    ["Porte de la chambre avec verrou", 3],
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