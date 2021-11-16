# frozen_string_literal: true

class TagsActivity < ApplicationRecord
  belongs_to :tag
  belongs_to :activity
  validates :tag_id, :activity_id, presence: true
end
