# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |x|
  user = User.create!(
  name: Faker::Pokemon.name,
  bio: "#{Faker::Demographic.race}\n" + "#{Faker::Demographic.sex}\n" + "#{Faker::Demographic.educational_attainment}",
  email: Faker::Internet.safe_email,
  picture: "corgi#{x+1}.jpg",
  password: "password"
  )
  3.times do
    user.posts.create!(
    title: Faker::StarWars.quote,
    body: Faker::Hipster.paragraphs(4).join("\n"),
    created_at: rand(1..100).days.ago
    )
  end




end
