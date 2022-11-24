# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

puts "destruction de la base de données bar à jeu..."
drink_food_boolean = [true, false]
# type_of_games = ["Jeux de cartes", "Jeux de société", "Billard", "Fléchettes", "Lancer de hâches", "Jeux de dés"]

GamingSession.destroy_all
puts "...destruction faite"
puts "maintenant au tour des Users..."
User.destroy_all
puts "c'est fait!"

puts "création de 5 users et 7 gaming bars..."
user_1 = User.create(password: "123456", first_name:"Étienne", last_name:"Klépal", email: "etienne.klepal@gmail.com")
user_2 = User.create(password: "123456", first_name:"Nadia", last_name:"Auger", email: "nadia@gmail.com")
user_3 = User.create(password: "123456", first_name:"Hugo", last_name:"Mancini", email: "hugo.mancini@gmail.com")
user_4 = User.create(password: "123456", first_name:"Eli", last_name:"Yaffa", email: "eli.yaffa@gmail.com")
user_5 = User.create(password: "123456", first_name:"Michel", last_name:"Sardou", email: "michel.sardou@gmail.com")


file1 = URI.open("app/assets/images/seeds/bar11.jpg")
file2 = URI.open("app/assets/images/seeds/bar12.jpg")
file3 = URI.open("app/assets/images/seeds/bar13.jpg")
bar_a_jeu_1 = GamingSession.new(name: "le cocon ludique", address: "227 Rue Saint-Martin, 75003 Paris", number_of_participants: 50, description: "blablabla", price:800, food:drink_food_boolean.sample, drink:drink_food_boolean.sample, game_type: GamingSession::GAMES_TYPES.shuffle.sample)
bar_a_jeu_1.user = user_1
bar_a_jeu_1.photos.attach(io: file1, filename: "bar11.jpg", content_type: "image/jpg")
bar_a_jeu_1.photos.attach(io: file2, filename: "bar12.jpg", content_type: "image/jpg")
bar_a_jeu_1.photos.attach(io: file3, filename: "bar13.jpg", content_type: "image/jpg")
bar_a_jeu_1.save

file4 = URI.open("app/assets/images/seeds/bar21.jpg")
file5 = URI.open("app/assets/images/seeds/bar22.jpg")
file6 = URI.open("app/assets/images/seeds/bar23.jpg")
bar_a_jeu_2 = GamingSession.new(name: "les mauvais joueurs", address: "46 Rue Sedaine, 75011 Paris", number_of_participants: 30, user_id: 1, description: "blablabla", price:500, food:drink_food_boolean.sample, drink:drink_food_boolean.sample, game_type: GamingSession::GAMES_TYPES.shuffle.sample)
bar_a_jeu_2.user = user_2
bar_a_jeu_2.photos.attach(io: file4, filename: "bar21.jpg", content_type: "image/jpg")
bar_a_jeu_2.photos.attach(io: file5, filename: "bar22.jpg", content_type: "image/jpg")
bar_a_jeu_2.photos.attach(io: file6, filename: "bar23.jpg", content_type: "image/jpg")
bar_a_jeu_2.save

file7 = URI.open("app/assets/images/seeds/bar31.jpg")
file8 = URI.open("app/assets/images/seeds/bar32.jpg")
file9 = URI.open("app/assets/images/seeds/bar33.jpg")
bar_a_jeu_3 = GamingSession.new(name: "la revanche", address: "38 Av. Daumesnil, 75012 Paris", number_of_participants: 20, description:"blablabla", price:350, food:drink_food_boolean.sample, drink:drink_food_boolean.sample, game_type: GamingSession::GAMES_TYPES.shuffle.sample)
bar_a_jeu_3.user = user_3
bar_a_jeu_3.photos.attach(io: file7, filename: "bar31.jpg", content_type: "image/jpg")
bar_a_jeu_3.photos.attach(io: file8, filename: "bar32.jpg", content_type: "image/jpg")
bar_a_jeu_3.photos.attach(io: file9, filename: "bar33.jpg", content_type: "image/jpg")
bar_a_jeu_3.save

file10 = URI.open("app/assets/images/seeds/bar41.jpg")
file11 = URI.open("app/assets/images/seeds/bar42.jpg")
file12 = URI.open("app/assets/images/seeds/bar43.jpg")
bar_a_jeu_4 = GamingSession.new(name: "Oya", address: "25 Rue de la Reine Blanche, 75013 Paris", number_of_participants: 35, description:"blablabla", price:600)
bar_a_jeu_4.user = user_1
bar_a_jeu_4.photos.attach(io: file10, filename: "bar41.jpg", content_type: "image/jpg")
bar_a_jeu_4.photos.attach(io: file11, filename: "bar42.jpg", content_type: "image/jpg")
bar_a_jeu_4.photos.attach(io: file12, filename: "bar43.jpg", content_type: "image/jpg")
bar_a_jeu_4.save

file13 = URI.open("app/assets/images/seeds/bar51.jpg")
file14 = URI.open("app/assets/images/seeds/bar52.jpg")
file15 = URI.open("app/assets/images/seeds/bar53.jpg")
bar_a_jeu_5 = GamingSession.new(name: "Dernier bar avant la fin du monde", address: "19 Av. Victoria, 75001 Paris", number_of_participants: 50, description:"blablabla", price:850, food:drink_food_boolean.sample, drink:drink_food_boolean.sample, game_type: GamingSession::GAMES_TYPES.shuffle.sample)
bar_a_jeu_5.user = user_1
bar_a_jeu_5.photos.attach(io: file13, filename: "bar51.jpg", content_type: "image/jpg")
bar_a_jeu_5.photos.attach(io: file14, filename: "bar52.jpg", content_type: "image/jpg")
bar_a_jeu_5.photos.attach(io: file15, filename: "bar53.jpg", content_type: "image/jpg")
bar_a_jeu_5.save

file16 = URI.open("app/assets/images/seeds/bar61.jpg")
file17 = URI.open("app/assets/images/seeds/bar62.jpg")
file18 = URI.open("app/assets/images/seeds/bar63.jpg")
bar_a_jeu_6 = GamingSession.new(name: "Loufoque", address: "57 Rue Galande, 75005 Paris", number_of_participants: 35, description:"blablabla", price:700, food:drink_food_boolean.sample, drink:drink_food_boolean.sample, game_type: GamingSession::GAMES_TYPES.shuffle.sample)
bar_a_jeu_6.user = user_4
bar_a_jeu_6.photos.attach(io: file16, filename: "bar61.jpg", content_type: "image/jpg")
bar_a_jeu_6.photos.attach(io: file17, filename: "bar62.jpg", content_type: "image/jpg")
bar_a_jeu_6.photos.attach(io: file18, filename: "bar63.jpg", content_type: "image/jpg")
bar_a_jeu_6.save

puts "création terminée!"
