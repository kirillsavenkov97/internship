# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ActivityQuery do
  describe '.activities_sort' do
    subject(:result) { described_class }

    context 'when passing price_asc' do
      it { expect(result.call({ order: 'price_asc' }).to_sql).to include('ASC') }
    end

    context 'when passing price_desc' do
      it { expect(result.call({ order: 'price_desc' }).to_sql).to include('DESC') }
    end

    context 'when passing weight' do
      it { expect(result.call({ order: 'weight' }).to_sql).to include('weight') }
    end
  end
end
