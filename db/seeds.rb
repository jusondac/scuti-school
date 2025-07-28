# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

3.times do |i|
  User.find_or_create_by!(email: "teacher#{i + 1}@example.com") do |user|
    user.role = 'teacher'
    user.access_level = 'normal'
    user.password = 'password123'
  end
end

10.times do |i|
  User.find_or_create_by!(email: "student#{i + 1}@example.com") do |user|
    user.role = 'student'
    user.access_level = 'normal'
    user.password = 'password123'
  end
end

User.find_or_create_by!(email: "master@gmail.com") do |user|
  user.role = 'admin'
  user.access_level = 'high'
  user.password = 'password123'
end
