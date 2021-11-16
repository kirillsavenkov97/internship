# frozen_string_literal: true

class TagsActivitiesLoaderService
  class << self
    def call
      City.pluck(:id).each do |city_id|
        Sputnik8::ApiClient.new.tag(city_id)[0]['sub_categories'].each do |category|
          tag_operator(category)
        end
      end
    end

    private

    def tag_operator(category)
      tag = Tag.find_by(id: category['id'])
      if tag.nil?
        tag_creator(category)
      else
        tag.update(name: category['name'])
        tags_activtities_creator(category)
      end
    end

    def tag_creator(data_category)
      Tag.create!(id: data_category['id'], name: data_category['name'], weight: 0)
      tags_activtities_creator(data_category)
    end

    def tags_activtities_creator(data_category)
      data_category['products'].each do |product|
        next if Activity.find_by(id: product['id']).nil?

        TagsActivity.create!(tag_id: data_category['id'],
                             activity_id: product['id'])
      end
    end
  end
end
