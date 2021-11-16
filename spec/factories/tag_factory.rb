# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    id { 1 }
    name { 'this is tag name' }
    weight { 0 }
  end
end
