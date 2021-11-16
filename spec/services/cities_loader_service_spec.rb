# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CitiesLoaderService do
  describe '.call' do
    let(:result) { described_class.call }
    let(:client) { instance_double('Sputnik8::ApiClient') }

    context 'when correct' do
      before do
        allow(Sputnik8::ApiClient).to receive(:new).and_return(client)
        allow(client).to receive(:cities).and_return([{ 'id' => 1, 'region_id' => 1, 'country_id' => 10,
                                                        'name' => 'Санкт-петербург' }])
        allow(client).to receive(:city).and_return({ 'id' => 1,
                                                     'name' => 'Санкт-Петербург',
                                                     'geo' => { 'description' => { 'image' => 'link to photo' } },
                                                     'providers' => 1294 })
      end

      let(:city) do
        result
        City.last
      end

      it 'returns correct result', :aggregate_failures do
        expect(city.id).to eq(1)
        expect(city.name).to eq('Санкт-Петербург')
        expect(city.photo).to eq('link to photo')
        expect(city.weight).to eq(1294)
      end
    end

    context 'when incorrect call' do
      before do
        allow(Sputnik8::ApiClient).to receive(:new).and_return(client)
        allow(client).to receive(:city).and_raise(Sputnik8::StatusException)
        allow(client).to receive(:cities).and_return([{ id: 1, region_id: 1,
                                                        country_id: 10,
                                                        name: 'Санкт-петербург' }])
      end

      it { expect { result }.to raise_error(Sputnik8::StatusException) }
    end

    context 'when incorrect cities loading' do
      before do
        allow(Sputnik8::ApiClient).to receive(:new).and_return(client)
        allow(client).to receive(:cities).and_raise(Sputnik8::StatusException)
      end

      it { expect { result }.to raise_error(Sputnik8::StatusException) }
    end
  end
end
