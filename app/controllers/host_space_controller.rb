class HostSpaceController < ApplicationController
  before_action :authenticate_user!, :check_is_host

  def index
    @reservations = Reservation.includes(:user, location: [:user]).where(user_id: current_user.id).where('status = ? OR status IS ?', false, nil)
  end

  def locations
    @locations = Location.where(user_id: current_user.id)
  end

  def locations_reservations
    @reservations = Reservation.where(location_id: params['id'])
  end

  def accept_reservation
    @reservation = Reservation.find(params['id'])
    if (@reservation)
      @reservation.status = 1
      @reservation.save
      flash[:success] = "La demande a été validée, on va se faire du fric mon gars"
      return redirect_to hosting_path
    else
      flash[:success] = "Impossible de mettre la main sur cette demande"
    end
    redirect_to hosting_path
  end

  def decline_reservation
    if (Reservation.destroy(params['id']))
      flash[:success] = "La demande a été refusée, c'est dommage on rate du frice là"
      return redirect_to hosting_path
    else
      flash[:success] = "Impossible de mettre la main sur cette demande"
    end
    redirect_to hosting_path
  end

  def check_is_host
    unless current_user.is_host
      # redirect to become host
      redirect_to hosting_path
    end
  end

end
