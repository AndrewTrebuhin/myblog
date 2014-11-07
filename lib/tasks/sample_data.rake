namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(login: 'Example User',
                 email: 'user@example.com',
                 password: "password",
                 password_confirmation: "password",
                 admin: true)

    User.create!(login: 'Plastikman',
                 email: 'fam0us@list.ru',
                 password: 'password',
                 password_confirmation: 'password',
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

    users = User.all.limit(6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end