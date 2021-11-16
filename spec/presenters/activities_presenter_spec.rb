# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ActivitiesPresenter do
  describe '.cities_list' do
    before do
      create(:city, name: 'name2')
      create(:city, name: 'name1')
    end

    it 'returns cities in order', :aggregate_failures do
      expect(described_class.new({ page: 1 }).cities_list.pluck(:name)).to eq(%w[name1 name2])
    end
  end

  describe '.activities' do
    context 'when order parameter is price asc' do
      before do
        create(:activity, title: '10 USD', price: 10, currency: 'USD')
        create_list(:activity, 50)
      end

      it 'orders activities and paginates', :aggregate_failures do
        expect(described_class.new({ order: 'price asc' }).activities.size).to eq(50)
        expect(described_class.new({ order: 'price asc' }).activities.first.price).to eq(10)
      end
    end

    context 'when order parameter is price desc' do
      before do
        create(:activity, title: '1000 EUR', price: 1000, currency: 'EUR')
        create(:activity, title: '10 USD', price: 10, currency: 'USD')
      end

      it 'order activities and paginates', :aggregate_failures do
        expect(described_class.new({ order: 'price desc' }).activities.first.price).to eq(1000)
      end
    end
  end

  describe '.city_filter_label' do
    context 'when city_id is nil' do
      it { expect(described_class.new({ city_id: nil }).city_filter_label).to eq('Город') }
    end

    context 'when city_id is present' do
      before do
        create(:city, id: 8, name: 'Бангкок')
      end

      it { expect(described_class.new({ city_id: 8 }).city_filter_label).to eq('Бангкок') }
    end
  end
end
