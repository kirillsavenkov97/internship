# frozen_string_literal: true

require 'rails_helper'
RSpec.describe CityPresenter do
  describe '.activities_in_city' do
    let(:city1) { create(:city, id: 1) }
    let(:city2) { create(:city, id: 2) }
    let(:activity1) { create(:activity, city: city1) }
    let(:activity2) { create(:activity, city: city2) }
    let(:result) { described_class.new({ city_id: 1 }) }

    before do
      activity1
      activity2
    end

    it 'shows activities in current city', :aggregate_failures do
      expect(result.activities).not_to include(activity2)
      expect(result.activities).to include(activity1)
    end
  end
end
