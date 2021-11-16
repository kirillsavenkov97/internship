# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TagsActivity, type: :model do
  subject(:tags_activity) do
    build(:tags_activity, activity: activity, tag: tag)
  end

  let(:activity) { create(:activity) }
  let(:tag) { create(:tag) }

  describe '#save' do
    context 'when valid' do
      it { expect { tags_activity.save }.to change(described_class, :count).by(1) }
    end

    context 'when invalid' do
      subject(:tags_activity) do
        build(:tags_activity, activity_id: nil, tag_id: nil)
      end

      it 'is not valid without fields', :aggregate_failures do
        expect { tags_activity.save }.not_to change(described_class, :count)
        expect(tags_activity.errors.keys).to match_array(%i[activity_id activity tag_id tag])
      end
    end
  end
end
