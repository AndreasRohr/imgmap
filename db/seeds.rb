# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
map = Map.create(title: "Gurtenfestival", lat: 46.91783849056467, lng: 7.441518321128134, zoom: 17)
ImageSet.create(title: "Ground", typ:"Ground",color:"red", map: map)
