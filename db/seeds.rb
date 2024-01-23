# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Create 4 users
users = []
6.times do |i|
  users << User.create(name: "User #{i + 1}")
end

# Create 10 posts for each user
users.each do |user|
  6.times do |i|
    post = user.posts.create(title: "This is Post #{i + 1} by #{user.name}", text: "This is the content of post #{i + 1} by #{user.name}")

    # post = user.posts.create(title: "Post #{i + 1} by #{user.name}", text: "This is the content of post #{i + 1} by #{user.name}")

    # Create varying short comments for each post
    rand(3..6).times do
        post.comments.create(user_id: User.pluck(:id).sample, text: Faker::Lorem.sentence(word_count: 5))
      end
      

    # Create varying likes for each post
    rand(1..4).times do
      post.likes.create(user_id: User.pluck(:id).sample)
    end
  end
end
