# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject(:tag) do
    build(:tag)
  end

  describe '#save' do
    context 'when valid' do
      it { expect { tag.save }.to change(described_class, :count).by(1) }
    end

    context 'when invalid' do
      subject(:tag) do
        build(:tag, name: nil, weight: nil)
      end

      it 'isnt valid without fields', :aggregate_failures do
        expect { tag.save }.not_to change(described_class, :count)
        expect(tag.errors.keys).to match_array(%i[name weight])
      end
    end
  end
end
