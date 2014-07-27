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


#   Reviews.create :name => skill, :context => 'technical'
# end

# # create a few creative skills
# design_skills = %w(Photoshop Illustrator Responsive-Design)
# design_skills.each do |skill|
#   Skill.create :name => skill, :context => 'creative'
# end
