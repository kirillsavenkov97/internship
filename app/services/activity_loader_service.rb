# frozen_string_literal: true

class ActivityLoaderService
  class << self
    def call
      City.pluck(:id).each do |id|
        100.times.each do |page|
          Sputnik8::ApiClient.new.activities(id, page).each do |activity_data|
            comparison(activity_data)
          end
        end
      end
    end

    private

    def comparison(activity_data)
      activity = Activity.find_by(id: activity_data['id'])
      if activity.nil?
        Activity.create!(params(activity_data).merge(id: activity_data['id']))
      else
        activity.update(params(activity_data))
      end
    end

    def params(activity_data)
      { city_id: activity_data['city_id'], title: activity_data['title'],
        description: activity_data['description'], photo: activity_data.dig('main_photo', 'original'),
        price: activity_data['price'].to_f,
        customers_review_rating: activity_data['customers_review_rating'],
        currency: currency(activity_data['price'].scan(/\$|€|₽|грн./)[0]) }
    end

    def currency(activity_data)
      {
        '$' => 'USD',
        '€' => 'EUR',
        '₽' => 'RUB',
        'грн.' => 'UAH'
      }[activity_data]
    end
  end
end
