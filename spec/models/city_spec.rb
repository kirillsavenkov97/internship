# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  subject(:city) do
    build(:city)
  end

  describe '#save' do
    context 'when valid' do
      it { expect { city.save }.to change(described_class, :count).by(1) }
    end

    context 'when invalid' do
      subject(:city) do
        build(:city, name: nil, photo: nil, weight: nil)
      end

      it 'isnt vaild without fields', :aggregate_failures do
        expect { city.save }.not_to change(described_class, :count)
        expect(city.errors.keys).to match_array(%i[name weight])
      end
    end
  end
end
