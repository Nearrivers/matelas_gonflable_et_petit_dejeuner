class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, only: %i[create]

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.where(user_id: current_user.id).where('status', true)
    @waiting_reservations = Reservation.where(user_id: current_user.id).where('status = ? OR status IS ?', false, nil)
    # @old_reservations = Reservation.where(user_id: current_user.id).where("DATE(date_out) < ?", DateTime.now).where('status = ?', true)
    @old_reservations = Reservation.where(user_id: current_user.id).where('status = ?', true)
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.status = false
    @reservation.save

    options = params['options']
    options.each do |o|
      ro = ReservationsOption.new
      ro.reservation_id = @reservation.id
      ro.option_id = o.to_i
      ro.save
    end

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.permit(:user_id, :location_id, :price, :date_in, :date_out, :nb_people, :stripe_reference, :status, :options)
  end
end
