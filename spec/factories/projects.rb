FactoryBot.define do
  factory :project do
    association :authorizer, factory: :user
    team
    org { Faker::Lorem.word }
    repo { Faker::Lorem.word }
    github_id { Random.rand(1_000_000) }
  end
end
