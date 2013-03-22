namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_recipes
    make_relations
  end
end

def make_users
  admin = User.create!(username:     "monts",
                       email:    "montropistic@gmail.com",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
  50.times do |n|
    username  = Faker::Name.first_name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(username:     username,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_recipes
  users = User.all(limit: 6)
  5.times do
    title = Faker::Lorem.words(1).to_s.capitalize
    description = Faker::Lorem.sentence(10)
    users.each { |user| user.recipes.create!(title: title, description: description) }
  end
end

def make_relations
  users = User.all
  user  = users.first
  followed_users = users[2..45]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
