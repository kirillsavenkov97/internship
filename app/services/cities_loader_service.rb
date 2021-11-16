# frozen_string_literal: true

class CitiesLoaderService
  class << self
    def call
      load_ids.each_with_index do |id, index|
        break if index == 100

        city_data = Sputnik8::ApiClient.new.city(id)
        City.create!(id: id, name: city_data['name'], photo: city_data.dig('geo', 'description', 'image'),
                     weight: city_data['providers'])
      end
    end

    private

    def load_ids
      parsed_data = Sputnik8::ApiClient.new.cities
      parsed_data.pluck('id')
    end
  end
end
