class ApplicationController < ActionController::Base
  def index
    @latest_locations = Location.limit(4)
    @latest_locations.inspect

    render template: '/layouts/_latest_locations'
  end
end
