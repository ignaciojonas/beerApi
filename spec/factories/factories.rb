require 'faker'
FactoryBot.define do 
    factory :beer do
        name { Faker::Beer.name }
        rating { Faker::Number.within(range: 1..5) }
        style { Style.first || FactoryBot.create(:style) }
    end

    factory :style do
        name { Faker::Beer.style }
        description { Faker::Lorem.paragraph }
    end
end