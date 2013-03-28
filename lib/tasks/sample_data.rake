namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_thoughts
    make_recipes
    make_relations
  end
end

def make_users
  admin = User.create!(username:     "Monts",
                       email:    "montropistic@gmail.com",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    username  = "#{Faker::Name.first_name}-#{n+1}"
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(username:     username,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_thoughts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.thoughts.create!(content: content) }
  end
end

def make_recipes
  users = User.all(limit: 6)
  50.times do
    title = Faker::Lorem.sentence(3)
    description = Faker::Lorem.sentence(10)
    users.each { |user| user.recipes.create!(title: title, description: description) }
  end
end

def make_relations
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed, "User") }
  followers.each      { |follower| follower.follow!(user, "User") }
end