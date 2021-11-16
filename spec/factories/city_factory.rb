# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    name { 'city name' }
    photo { 'this is link to photo' }
    weight { 1 }
  end
end
