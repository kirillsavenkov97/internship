# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sputnik8::ApiClient do
  describe '#activities' do
    let(:client) { described_class.new }
    let(:activities_response) { client.activities(1, 1) }

    context 'when success' do
      it 'is connecting to api', :vcr, :aggregate_failures do
        expect(activities_response.first.keys).to include('city_id', 'title', 'description', 'main_photo', 'price',
                                                          'customers_review_rating')
      end
    end

    context 'when status not equal 200' do
      it 'raises exception',
         vcr: { cassette_name: 'Sputnik8_ApiClient/_activities/when_failure/is_connecting_to_api' } do
        expect { activities_response }.to raise_error(Sputnik8::StatusException)
      end
    end
  end

  describe '#city' do
    let(:client) { described_class.new }
    let(:response_id) { 1 }
    let(:city_response) { client.city(response_id) }

    context 'when success' do
      it 'is connecting to api with id', :vcr, :aggregate_failures do
        expect(city_response).to include('name', 'providers', 'geo')
      end
    end

    context 'when status not equal 200' do
      it 'raises exception',
         vcr: { cassette_name: 'Sputnik8_ApiClient/_city/when_failure/is_connecting_to_api' } do
        expect { city_response }.to raise_error(Sputnik8::StatusException)
      end
    end
  end

  describe '#cities' do
    let(:client) { described_class.new }
    let(:cities_response) { client.cities }

    context 'when success' do
      it 'is connecting to api', :vcr, :aggregate_failures do
        expect(cities_response.first.keys).to include('id', 'region_id', 'country_id', 'name')
      end
    end

    context 'when status not equal 200' do
      it 'raises exception',
         vcr: { cassette_name: 'Sputnik8_ApiClient/_cities/when_failure/is_connecting_to_api' } do
        expect { cities_response }.to raise_error(Sputnik8::StatusException)
      end
    end
  end

  describe '#tag' do
    let(:client) { described_class.new }
    let(:response_id) { 1 }
    let(:tag_response) { client.tag(response_id) }

    context 'when success' do
      it 'is connecting to api with id', :vcr, :aggregate_failures do
        expect(tag_response.first.keys).to include('sub_categories')
      end
    end

    context 'when status not equal 200' do
      it 'raises exception',
         vcr: { cassette_name: 'Sputnik8_ApiClient/_tag/when_failure/is_connecting_to_api' } do
        expect { tag_response }.to raise_error(Sputnik8::StatusException)
      end
    end
  end
end
