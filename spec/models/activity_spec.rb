# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity, type: :model do
  subject(:activity) do
    build(:activity, city: city)
  end

  let(:city) { create(:city) }

  describe '#save' do
    context 'when valid' do
      it { expect { activity.save }.to change(described_class, :count).by(1) }
    end

    context 'when invalid' do
      subject(:activity) do
        build(:activity, title: nil, description: nil, photo: nil, price: nil, customers_review_rating: nil)
      end

      it 'is not valid without fields', :aggregate_failures do
        expect { activity.save }.not_to change(described_class, :count)
        expect(activity.errors.keys).to match_array(%i[city_id title price])
      end
    end
  end
end
