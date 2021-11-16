# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Activities', type: :request do
  describe 'GET /index' do
    before { get '#index' }

    it { expect(response).to have_http_status(:success) }
  end

  describe 'GET /show' do
    let(:activity) { create(:activity) }

    before do
      activity
      get activity_path(id: activity.id)
    end

    it { expect(response).to have_http_status(:success) }
  end
end
