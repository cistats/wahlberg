FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.user_name}
    email { Faker::Internet.email }
    image { Faker::Avatar.image }
  end
end
