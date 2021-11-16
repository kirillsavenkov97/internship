# frozen_string_literal: true

class CityPresenter
  def initialize(params)
    @params = params
  end

  def activities
    Activity.where(city_id: @params[:city_id]).paginate(page: @params[:page], per_page: 50)
  end
end
