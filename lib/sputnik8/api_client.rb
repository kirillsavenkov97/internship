# frozen_string_literal: true

require 'faraday'
module Sputnik8
  class StatusException < StandardError
    def initialize(message = 'status code Error', exception_type = 'response status')
      @exception_type = exception_type
      super(message)
    end
  end

  class ApiClient
    SPUTNIK8 = 'https://api.sputnik8.com/v1'

    def activities(city_id, activity_page)
      response('products', { city_id: city_id, page: activity_page })
    end

    def city(id)
      response("cities/#{id}")
    end

    def cities
      response('cities')
    end

    def tag(id)
      response("cities/#{id}/categories")
    end

    private

    def response(url_link, params = {})
      response = Faraday.get("#{SPUTNIK8}/#{url_link}", params.merge(
                                                          { api_key: Rails.application.credentials[:api_key].to_s,
                                                            username: Rails.application.credentials[:username].to_s }
                                                        ))
      raise StatusException, response.status.to_s if response.status != 200

      JSON.parse(response.body)
    end
  end
end
