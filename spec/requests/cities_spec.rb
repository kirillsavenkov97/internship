# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  describe 'GET /index' do
    before { get '#index' }

    it { expect(response).to have_http_status(:success) }
  end
end
