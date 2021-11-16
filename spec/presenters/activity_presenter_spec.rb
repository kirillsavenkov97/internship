# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ActivityPresenter do
  describe '.activity' do
    before do
      create(:activity, id: 2320, title: 'Индивидуальная обзорная экскурсия')
      create(:activity, id: 2321, title: 'не обзорная экскурсия')
    end

    it 'shows chosen activity', :aggregate_failures do
      expect(described_class.new({ id: 2320 }).activity.id).to eq(2320)
      expect(described_class.new({ id: 2320 }).activity.title).to eq('Индивидуальная обзорная экскурсия')
    end
  end
end
