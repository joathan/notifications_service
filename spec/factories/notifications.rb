# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    user_id { 1 }
  end
end
