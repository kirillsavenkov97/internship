# frozen_string_literal: true

class CitiesController < ApplicationController
  def index
    @presenter = CityPresenter.new(permitted_params)
  end

  def permitted_params
    params.permit(:city_id)
  end
end
