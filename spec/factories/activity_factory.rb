# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    city
    title { 'this is title' }
    description { 'this is description' }
    photo { 'this is link to photo' }
    price { 100 }
    customers_review_rating { 4.1 }
    currency { 'EUR' }
  end
end
