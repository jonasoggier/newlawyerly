# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

last_names = %w(
Malcom
Maybee
Keiko
Yeats
Alishia
Gillum
Adrianna
People
Majorie
Kimmell
Tifany
Rooker
Andres
Iddings
Porter
Lauderback
Harlan
Hilton
Luella
Coller
Shay
Mcguinness
Lyndsay
Gilpin
Buford
Guarino
Zetta
Suda
Shondra
Glidewell
Dania
Thrash
Zelda
Nutting
Emelia
Trinidad
Jodee
Royster
Rivka
Mauch
Salena
Orrell
Sheri
Kellerman
Mandi
Waring
Eugena
Kirby
Malinda
Gravely)

first_names = %w(
Ashly
Jake
Carmela
Larraine
Willard
Kelly
Claud
Angeles
Barney
Zola
Desmond
Vern
Amy
Damien
Jesica
Francie
Lea
Cornell
Nathanael
Arlena
Delmar
Erwin
Latoyia
Mildred
Johanne
Etta
Elvira
Shavonne
Classie
Doretta
Dorian
Kyla
Sanda
Jayson
Lorita
Bernarda
Divina
Jen
Glady
Blaine
Pearle
Jerold
Candy
Gladys
Quiana
Flossie
Marline
Sheridan
Nana
Carlos)

counter = 0

10.times do 
	user = User.create!(first_name: first_names[counter], last_name: last_names[counter], email: "#{first_names[counter]}.#{last_names[counter]}@gmail.com", teaser: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.', description: 'Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.', password: 'testttt')
 	5.times do
 		user.posts.create!(title: 'Lorem ipsum dolor sit amet', body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.') 
 	end
 	counter += 1
end

# Relationship.create!(user_id: (Random.rand(10)+1), followed_user_id: (Random.rand(10)+11))
Relationship.create!(user_id: 1, followed_user_id: 2)
Relationship.create!(user_id: 2, followed_user_id: 3)
Relationship.create!(user_id: 3, followed_user_id: 4)
Relationship.create!(user_id: 4, followed_user_id: 5)
Relationship.create!(user_id: 5, followed_user_id: 6)
Relationship.create!(user_id: 6, followed_user_id: 7)
Relationship.create!(user_id: 7, followed_user_id: 8)
Relationship.create!(user_id: 8, followed_user_id: 9)


