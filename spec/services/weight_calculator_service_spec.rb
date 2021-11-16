# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeightCalculatorService do
  describe '.call' do
    let(:result) { described_class.call }
    let(:tag) { create(:tag, activities: [create(:activity), create(:activity)]) }

    context 'when weight calculated correctly' do
      before { tag }

      it 'fills weight field', :aggregate_failures do
        expect { result }.to change { tag.reload.weight }.from(0).to(2)
        expect(Activity.last.weight).to eq(8.2)
      end
    end
  end
end
