# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ActivityLoaderService do
  describe '.call' do
    let(:result) { described_class.call }
    let(:client) { instance_double('Sputnik8::ApiClient') }
    let(:city) { create(:city) }

    context 'when populating correct' do
      before do
        allow(Sputnik8::ApiClient).to receive(:new).and_return(client)
        allow(client).to receive(:activities).and_return([{ 'id' => 1, 'city_id' => city.id,
                                                            'title' => 'activity title',
                                                            'description' => 'activity desc',
                                                            'main_photo' => { 'small' => 'photo' },
                                                            'price' => '18.00 $',
                                                            'customers_review_rating' => 4.7 }])
      end

      let(:activity) do
        result
        Activity.last
      end

      it 'returns correct result', :aggregate_failures do
        expect(activity.city_id).to eq(city.id)
        expect(activity.title).to eq('activity title')
        expect(activity.description).to eq('activity desc')
        expect(activity.price).to eq(18.0)
        expect(activity.currency).to eq('USD')
      end
    end

    context 'when incorrect' do
      before do
        allow(Sputnik8::ApiClient).to receive(:new).and_return(client)
        allow(client).to receive(:activities).with(city.id, 0).and_raise(Sputnik8::StatusException)
      end

      it 'raises error' do
        expect { result }.to raise_error(Sputnik8::StatusException)
      end
    end
  end
end
