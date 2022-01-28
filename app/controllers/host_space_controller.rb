class HostSpaceController < ApplicationController
  before_action :authenticate_user!, :check_is_host

  def index

  end

  def locations
    @locations = Location.where(user_id: current_user.id)
  end

  def check_is_host
    unless current_user.is_host
      # redirect to become host
      redirect_to hosting_path
    end
  end

end
