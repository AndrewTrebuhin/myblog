FactoryGirl.define do
  factory :user do
    login "Michael Hartl"
    email "michael@example.com"
    password 'password'
    password_confirmation 'password'
  end
end