require 'faker'

# create a few users
25.times do
  User.create :name          => Faker::Name.name,
              :email         => Faker::Internet.email,
              :password_hash => Faker::Lorem.word,
              :patron_rating => (1..5).to_a.sample,
              :about_me      => Faker::Lorem.sentence,
              :cafe_location => nil,
              :cafe_rating   => nil,
              :cafe_about    => nil
end

5.times do
  User.create :name          => Faker::Name.name,
              :email         => Faker::Internet.email,
              :password_hash => Faker::Lorem.word,
              :patron_rating => (1..5).to_a.sample,
              :about_me      => Faker::Lorem.sentence,
              :cafe_location => Faker::Address.street_address,
              :cafe_rating   => (1..5).to_a.sample,
              :cafe_about    => Faker::Lorem.sentence
end

10.times do
  Review.create :user_review => Faker::Lorem.sentence,
                :cafe_review => nil
end

10.times do
  Review.create :user_review => Faker::Lorem.sentence,
                :cafe_review => Faker::Lorem.sentence
end


