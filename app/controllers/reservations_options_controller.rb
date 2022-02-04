class ReservationsOptionsController < ApplicationController
  before_action :set_reservations_option, only: %i[ show edit update destroy ]

  # GET /reservations_options or /reservations_options.json
  def index
    @reservations_options = ReservationsOption.all
  end

  # GET /reservations_options/1 or /reservations_options/1.json
  def show
  end

  # GET /reservations_options/new
  def new
    @reservations_option = ReservationsOption.new
  end

  # GET /reservations_options/1/edit
  def edit
  end

  # POST /reservations_options or /reservations_options.json
  def create
    @reservations_option = ReservationsOption.new(reservations_option_params)

    respond_to do |format|
      if @reservations_option.save
        format.html { redirect_to @reservations_option, notice: "Reservations option was successfully created." }
        format.json { render :show, status: :created, location: @reservations_option }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservations_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations_options/1 or /reservations_options/1.json
  def update
    respond_to do |format|
      if @reservations_option.update(reservations_option_params)
        format.html { redirect_to @reservations_option, notice: "Reservations option was successfully updated." }
        format.json { render :show, status: :ok, location: @reservations_option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservations_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations_options/1 or /reservations_options/1.json
  def destroy
    @reservations_option.destroy
    respond_to do |format|
      format.html { redirect_to reservations_options_url, notice: "Reservations option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservations_option
      @reservations_option = ReservationsOption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservations_option_params
      params.require(:reservations_option).permit(:reservation_id, :option_id)
    end
end
