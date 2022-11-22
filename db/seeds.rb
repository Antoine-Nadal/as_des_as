# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destruction de la base de données bar à jeu..."

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

bar_a_jeu_1 = GamingSession.new(name: "le cocon ludique", address: "227 Rue Saint-Martin, 75003 Paris", number_of_participants: 50, description: "blablabla")
bar_a_jeu_1.user = user_1
bar_a_jeu_1.save
bar_a_jeu_2 = GamingSession.new(name: "les mauvais joueurs", address: "46 Rue Sedaine, 75011 Paris", number_of_participants: 30, user_id: 1, description: "blablabla")
bar_a_jeu_2.user = user_2
bar_a_jeu_2.save
bar_a_jeu_3 = GamingSession.new(name: "la revanche", address: "38 Av. Daumesnil, 75012 Paris", number_of_participants: 20, description:"blablabla")
bar_a_jeu_3.user = user_3
bar_a_jeu_3.save
bar_a_jeu_4 = GamingSession.new(name: "Oya", address: "25 Rue de la Reine Blanche, 75013 Paris", number_of_participants: 35, description:"blablabla")
bar_a_jeu_1.user = user_1
bar_a_jeu_1.save
bar_a_jeu_5 = GamingSession.new(name: "Dernier bar avant la fin du monde", address: "19 Av. Victoria, 75001 Paris", number_of_participants: 50, description:"blablabla")
bar_a_jeu_1.user = user_1
bar_a_jeu_1.save
bar_a_jeu_6 = GamingSession.new(name: "Loufoque", address: "57 Rue Galande, 75005 Paris", number_of_participants: 35, description:"blablabla")
bar_a_jeu_4.user = user_4
bar_a_jeu_4.save
bar_a_jeu_7 = GamingSession.new(name: "Les grands gamins", address: "19 Rue de Cléry, 75002 Paris", number_of_participants: 25, description:"blablabla")
bar_a_jeu_5.user = user_5
bar_a_jeu_5.save
puts "création terminée!"
