# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# SH: Seed cocktails

puts "> "
puts "> "
puts "> ### SEEDING INGREDIENTS ###"

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
data_serialized = open(url).read
data = JSON.parse(data_serialized)

data['drinks'].each do |drink|
  puts drink['strIngredient1']
  Ingredient.create(name: drink['strIngredient1'])
end

puts "> ### DONE (1/3) ###"

# SH: Seed cocktails

puts "> "
puts "> "
puts "> ### SEEDING COCKTAILS ###"

10.times do
  cocktail = Cocktail.new(
    name: Faker::Science.element,
    )
  puts cocktail.name
  cocktail.save!
end

puts "> ### DONE (2/3) ###"

# SH: Seed doses

puts "> "
puts "> "
puts "> ### SEEDING DOSES ###"

puts "> ### DONE (3/3) ###"
