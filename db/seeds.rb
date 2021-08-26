# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#User.destroy_all
#Post.destroy_all
25.times do |i|
  User.create(
    name: Faker::Name.first_name, 
    photo: "https://picsum.photos/200/300?random=#{i}",
    email: "user#{i}@mail.com",
    password: '123456',
    password_confirmation: '123456'
  )
end

users = User.all

150.times do |i|
  Post.create!(
    content: Faker::GreekPhilosophers.quote,
    user: users.sample
  )
end

posts = Post.all

500.times do |i|
  Like.create(
    user: users.sample,
    post: posts.sample
  )
end