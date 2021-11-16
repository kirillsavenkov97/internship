# frozen_string_literal: true

class ActivitiesController < ApplicationController
  def index
    @presenter = ActivitiesPresenter.new(permitted_params_index)
  end

  def show
    @presenter = ActivityPresenter.new(permitted_params_show)
  end

  def permitted_params_index
    params.permit(:city_id, :order)
  end

  def permitted_params_show
    params.permit(:id)
  end
end
