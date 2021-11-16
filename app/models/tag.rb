# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :tags_activities, dependent: :destroy
  has_many :activities, through: :tags_activities
  validates :name, :weight, presence: true
end
