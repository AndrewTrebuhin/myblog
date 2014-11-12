namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
  User.create!(login: 'Plastikman',
               email: 'fam0us@list.ru',
               password: 'password',
               password_confirmation: 'password',
               admin: true)

  User.create!(login: 'Example User',
               email: 'user@example.com',
               password: "password",
               password_confirmation: "password",
               admin: true)

  50.times do |n|
    login = Faker::Name.name
    email = Faker::Internet.email
    password = "password"
    User.create!(login: login,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all.limit(6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end