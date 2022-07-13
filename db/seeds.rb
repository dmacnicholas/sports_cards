# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Card.destroy_all
Brand.destroy_all

@brand_1 = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
@brand_2 = Brand.create!(name: 'Mosaic', year: 2022, sold_at_retail: true)
@brand_3 = Brand.create!(name: 'Donruss', year: 2021, sold_at_retail: true)
@brand_4 = Brand.create!(name: 'Optic', year: 2020, sold_at_retail: true)

@card_1 = @brand_1.cards.create!(player_name: 'LeBron James', description: 'Red Fast Break', graded: true, value: 250.00)
@card_2 = @brand_1.cards.create!(player_name: 'Luka Doncic', description: 'Blue Fast Break', graded: false, value: 135.00)
@card_3 = @brand_1.cards.create!(player_name: 'Ja Morant', description: 'Purple Ice Auto', graded: true, value: 900.00)
@card_4 = @brand_1.cards.create!(player_name: 'Russell Westbrook', description: 'Green Refactor Auto', graded: true, value: 1700.00)
@card_5 = @brand_2.cards.create!(player_name: 'Stephen Curry', description: 'Green Swirl', graded: false, value: 92.00)
@card_6 = @brand_2.cards.create!(player_name: 'Anthony Edwards', description: 'Gold Prizm', graded: true, value: 1250.00)
@card_7 = @brand_2.cards.create!(player_name: 'Kevin Durant', description: 'Black Refactor', graded: false, value: 335.00)
@card_8 = @brand_2.cards.create!(player_name: 'Kyrie Irving', description: 'Moasic Throwback', graded: true, value: 540.00)
@card_9 = @brand_3.cards.create!(player_name: 'Nikola Jokic', description: 'White Refactor', graded: true, value: 292.00)
@card_10 = @brand_3.cards.create!(player_name: 'LaMelo Ball', description: 'Purple Disco', graded: true, value: 750.00)
@card_11 = @brand_3.cards.create!(player_name: 'Anthony Davis', description: 'Blue Modern Legends', graded: false, value: 115.00)
@card_12 = @brand_3.cards.create!(player_name: 'Joel Embiid', description: 'Yellow Refactor', graded: true, value: 420.00)
@card_13 = @brand_4.cards.create!(player_name: 'Zion Williamson', description: 'Pink Velocity', graded: true, value: 1600.00)
@card_14 = @brand_4.cards.create!(player_name: 'Trae Young', description: 'Elite Dominators', graded: true, value: 450.00)
@card_15 = @brand_4.cards.create!(player_name: 'Jayson Tatum', description: 'White Sparkle', graded: true, value: 335.00)
@card_16 = @brand_4.cards.create!(player_name: 'Devin Booker', description: 'Signature Series', graded: true, value: 630.00)
