require 'faker'

# Create Users
10.times do 
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Lists
10.times do
  list = List.create!(
    user:    users.sample,
    title:   Faker::App.name
    )
end
lists = List.all

# Create Items
200.times do
  item = Item.create!(
    list: lists.sample, 
    name: Faker::Lorem.word
  )  
end
items = Item.all

# Create an admin user
admin = User.new(
  name:     'Admin User',
  email:    'jeffreykliu@gmail.com',
  password: 'helloworld',
)
admin.skip_confirmation!
admin.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"