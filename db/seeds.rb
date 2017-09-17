# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
game = Game.create!

2.times do
    player = Player.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    PlayerGame.create!(game_id: game.id, player_id: player.id)
end

game.service_id = game.players.first.id
game.save!



