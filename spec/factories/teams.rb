FactoryBot.define do
  factory :team do
    name { Faker::Company.name }
    handle { Faker::Internet.user_name }
  end
end
