# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.create!(
  name: Faker::Pokemon.name,
  picture: Faker::Avatar.image
  )
  3.times do
    user.posts.create!(
    title: Faker::StarWars.quote,
    body: Faker::Hipster.paragraphs(4),
    created_at: rand(1..700).days.ago
    )
  end




end
