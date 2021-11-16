# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TagsActivitiesLoaderService do
  describe '.call' do
    let(:city) { create(:city, id: 10) }
    let(:result) { described_class.call }
    let(:client) { instance_double('Sputnik8::ApiClient') }
    let(:activity) { create(:activity, city: city) }

    context 'when api returns data' do
      before do
        allow(Sputnik8::ApiClient).to receive(:new).and_return(client)
        allow(client).to receive(:tag).and_return([{ 'sub_categories' => ['id' => 1, 'name' => 'tag name',
                                                                          'products' => [{ 'id' => activity.id }]] }])
      end

      let(:tags_activity) do
        result
        TagsActivity.last
      end

      it 'creates tags and tags_activites records', :aggregate_failures do
        expect(client).to receive(:tag).with(city.id)
        expect(tags_activity.activity_id).to eq(activity.id)
        expect(Tag.last.name).to eq('tag name')
      end
    end

    context 'when client method raises exception' do
      before do
        allow(Sputnik8::ApiClient).to receive(:new).and_return(client)
        allow(client).to receive(:tag).and_raise(Sputnik8::StatusException)
      end

      let(:tags_activity) do
        result
        TagsActivity.last
      end

      it 'raises error', :aggregate_failures do
        expect(client).to receive(:tag).with(9)
        expect { client.tag(9) }.to raise_error(Sputnik8::StatusException)
      end
    end
  end
end
