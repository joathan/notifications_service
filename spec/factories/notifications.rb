# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    task_id { 1 }
    user_id { 1 }
    title { Faker::Lorem.sentence }
    details { { label: Faker::Lorem.word, value: Faker::Lorem.word } }
    status { 'completed' }
  end
end
