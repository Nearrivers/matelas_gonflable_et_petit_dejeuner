class LocationAppliancesController < ApplicationController
  before_action :set_location_appliance, only: %i[ show edit update destroy ]

  # GET /location_appliances or /location_appliances.json
  def index
    @location_appliances = LocationAppliance.all
  end

  # GET /location_appliances/1 or /location_appliances/1.json
  def show
  end

  # GET /location_appliances/new
  def new
    @location_appliance = LocationAppliance.new
  end

  # GET /location_appliances/1/edit
  def edit
  end

  # POST /location_appliances or /location_appliances.json
  def create
    @location_appliance = LocationAppliance.new(location_appliance_params)

    respond_to do |format|
      if @location_appliance.save
        format.html { redirect_to @location_appliance, notice: "Location appliance was successfully created." }
        format.json { render :show, status: :created, location: @location_appliance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location_appliance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_appliances/1 or /location_appliances/1.json
  def update
    respond_to do |format|
      if @location_appliance.update(location_appliance_params)
        format.html { redirect_to @location_appliance, notice: "Location appliance was successfully updated." }
        format.json { render :show, status: :ok, location: @location_appliance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @location_appliance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_appliances/1 or /location_appliances/1.json
  def destroy
    @location_appliance.destroy
    respond_to do |format|
      format.html { redirect_to location_appliances_url, notice: "Location appliance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_appliance
      @location_appliance = LocationAppliance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_appliance_params
      params.require(:location_appliance).permit(:location_id, :appliance_id)
    end
end
