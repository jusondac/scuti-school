# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Only seed if User table is empty
if User.count == 0
  puts "Seeding users..."
  
  3.times do |i|
    User.find_or_create_by!(email: "teacher#{i + 1}@gmail.com") do |user|
      user.role = 'teacher'
      user.access_level = 'normal'
      user.password = 'password123'
    end
  end

  10.times do |i|
    User.find_or_create_by!(email: "student#{i + 1}@gmail.com") do |user|
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
  
  puts "Created #{User.count} users."
else
  puts "Users already exist. Skipping user creation."
end

# Create classrooms for each teacher
if ClassRoom.count == 0
  puts "Seeding classrooms..."
  
  subjects = ["Mathematics", "Science", "English", "History", "Physics", "Chemistry", "Biology", "Geography"]

  User.where(role: 'teacher').each do |teacher|
    # Each teacher gets 1-3 classrooms
    classroom_count = rand(1..3)
    
    classroom_count.times do |i|
      # Ensure at least one classroom is private (invite_only)
      visibility = (i == 0) ? :invite_only : [:visible_to_all, :invite_only].sample
      
      ClassRoom.find_or_create_by!(
        name: "#{subjects.sample} Class #{i + 1}",
        teacher: teacher
      ) do |classroom|
        classroom.subject = subjects.sample
        classroom.visibility = visibility
        classroom.status = :open
        classroom.quota = rand(15..30)
        classroom.description = "#{classroom.subject} class taught by #{teacher.email.split('@').first}"
      end
    end
  end
  
  puts "Created #{ClassRoom.count} classrooms."
else
  puts "Classrooms already exist. Skipping classroom creation."
end
