# frozen_string_literal: true

class ActivitiesPresenter
  def initialize(params)
    @params = params
  end

  def city_filter_label
    if @params[:city_id].nil?
      'Город'
    else
      City.find_by(id: @params[:city_id]).name
    end
  end

  def cities_list
    City.order('name')
  end

  def activities
    ActivityQuery.call(@params).paginate(page: @params[:page], per_page: 50)
  end
end
