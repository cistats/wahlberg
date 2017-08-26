FactoryGirl.define do
  factory :user do
    team
    name { Faker::Name.name }
    email { Faker::Internet.email }
    image { Faker::Avatar.image }
  end
end
