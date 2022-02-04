class LocationsController < ApplicationController
  before_action :set_location, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, :check_is_host, only: %i[edit new create update]

  # GET /locations or /locations.json
  def index
    @cpt = 0
    @locations = Location.all
    @great_locations = Location.order('avg_score DESC').limit(4)

  end

  # GET /locations/1 or /locations/1.json
  def show
    @options = Option.all;
  end

  # GET /locations/new
  def new
    @location = Location.new
    @appliances = Appliance.all
  end

  # GET /locations/1/edit
  def edit
    @appliances = Appliance.all
  end

  # GET/locations?where=&depart=&arrivee=&travelers=
  # Search route coming from the navbar
  def searchCriteria
    # to_i transforms the string into an integer (params[] always gives strings)
    arrival = Date.strptime(params[:arrivee], "%Y-%m-%d")
    departure = Date.strptime(params[:depart], "%Y-%m-%d")
    @results = Geocoder.search(params[:where])
    @locations = Location.near(params[:where]).where("nb_people_max >= ?", params[:travelers].to_i)
    @nbrOfDays = departure - arrival
    @total = 150
    @cpt = 1

    @great_locations = Location.order('avg_score DESC').limit(4)

    render template: '/locations/index'
  end

  # POST /locations or /locations.json
  def create
    @location = Location.new(location_params)
    @location.user_id = current_user.id
    respond_to do |format|
      if @location.save
        appliances_ids = params['appliance_ids']

        appliances_ids.each do | location_appliance|
          @location_appliance = LocationAppliance.new(location_id: @location.id, appliance_id: location_appliance)
          @location_appliance.save
        end

        format.html { redirect_to host_space_locations_path, notice: "Location was successfully created." }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1 or /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        appliances_ids = params['appliance_ids']

        appliances_ids.each do | location_appliance|
          @location_appliance = LocationAppliance.new(location_id: @location.id, appliance_id: location_appliance)
          @location_appliance.save
        end

        format.html { redirect_to host_space_locations_path, notice: "Location was successfully updated." }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1 or /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to host_space_locations_path, notice: "Location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #mise en fav
  # /locations/:id/fav
  def add_to_fav
    location = Location.find(params[:id])
    if current_user == nil || location == nil
      return redirect_to location, notice: "Vous devez être connecté pour effectuer cette action"
    end

    already_fav = UserFav.find_by(user_id: current_user.id, location_id: location.id)

    if already_fav != nil
      already_fav.destroy
      return redirect_to location, notice: "Favori retiré"
    end

    user_fav = UserFav.new
    user_fav.user_id = current_user.id
    user_fav.location_id = location.id
    user_fav.save
    return redirect_to location, notice: "Favori ajouté"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_location
    @location = Location.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def location_params
    params.require(:location).permit(:name, :nb_people_max, :nb_room, :nb_bed, :type_location, :description, :city, :street, :zip_code, :lat, :long, :price, :avg_score)
  end

  def check_is_host
    unless current_user.is_host
      # redirect to become host
      redirect_to hosting_path
    end
  end
end
