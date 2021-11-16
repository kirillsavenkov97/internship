# frozen_string_literal: true

class City < ApplicationRecord
  has_many :activities, dependent: :destroy
  validates :name, :weight, presence: true
end
