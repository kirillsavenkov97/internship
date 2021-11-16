# frozen_string_literal: true

class Activity < ApplicationRecord
  has_many :tags_activities, dependent: :destroy
  has_many :tags, through: :tags_activities
  belongs_to :city
  validates :city_id, :title, :price, presence: true
end
