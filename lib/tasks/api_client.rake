# frozen_string_literal: true

desc 'fill cities with data from API'
task city_load: :environment do
  CitiesLoaderService.call
end

desc 'fill activities with data from API'
task activity_load: :environment do
  ActivityLoaderService.call
end

desc 'fill tags and tags_activities with data from API'
task tag_load: :environment do
  TagsActivitiesLoaderService.call
end

desc 'calculate weight for tags'
task weight_calculate: :environment do
  WeightCalculatorService.call
end
