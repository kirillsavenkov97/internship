# frozen_string_literal: true

class ActivityPresenter
  def initialize(params)
    @params = params
  end

  def activity
    Activity.find_by(id: @params[:id])
  end
end
