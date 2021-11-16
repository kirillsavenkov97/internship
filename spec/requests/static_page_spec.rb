# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe 'GET /home' do
    before { get '#home' }

    it { expect(response).to have_http_status(:success) }
  end
end
