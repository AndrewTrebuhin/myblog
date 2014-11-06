namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(login: 'Example User',
                 email: 'user@example.com',
                 password: "foobar",
                 password_confirmation: "foobar",
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
end