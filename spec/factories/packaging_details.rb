FactoryBot.define do
  factory :packaging_detail do
    package_type { Faker::Lorem.sentences }
    weight { Faker::Number.number(digits: 2) }
    length { Faker::Number.number(digits: 2) }
    width { Faker::Number.number(digits: 2) }
    height { Faker::Number.number(digits: 2) }
    cbm { Faker::Lorem.sentences }
  end
end