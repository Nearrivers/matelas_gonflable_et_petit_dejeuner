class ApplicationController < ActionController::Base

  def index
    @great_locations = Location.order('avg_score DESC').limit(4)
    @latest_locations = Location.order('id DESC').limit(4)

    render template: '/layouts/_latest_locations'
  end
end
