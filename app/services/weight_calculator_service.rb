# frozen_string_literal: true

class WeightCalculatorService
  class << self
    def call
      Tag.eager_load(:tags_activities).find_each do |tag|
        tag.update!(weight: tag.tags_activities.size)
      end

      Activity.eager_load(:city).find_each do |activity|
        activity_weight_calculator(activity)
      end
    end

    private

    def activity_weight_calculator(activity)
      weight = Tag
               .joins(:tags_activities).where('tags_activities.activity_id': activity.id)
               .maximum(:weight)
      # rubocop:disable Rails/SkipsModelValidations
      activity.update_column(:weight, weight * activity.city.weight *
                      activity.customers_review_rating)
      # rubocop:enable Rails/SkipsModelValidations
    end
  end
end
