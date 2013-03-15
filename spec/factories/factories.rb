require 'factory_girl'


FactoryGirl.define do
  sequence(:email) { |i| "test_email#{i}@example.com" }

  factory :user do
    name { Faker::Name.name }
    email
    password 'password'
    password_confirmation 'password'
  end

  factory :game_user do
    user_id 1
    game_id 1
    player 1
  end

end
