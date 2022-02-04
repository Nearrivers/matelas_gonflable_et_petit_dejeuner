class UserFavsController < ApplicationController
  before_action :set_user_fav, only: %i[ show edit update destroy ]

  # GET /user_favs or /user_favs.json
  def index
    if current_user
      @user_favs = UserFav.where(user_id: current_user.id)
    else
      @user_favs = UserFav.all
    end
  end

  # GET /user_favs/1 or /user_favs/1.json
  def show
  end

  # GET /user_favs/new
  def new
    @user_fav = UserFav.new
  end

  # GET /user_favs/1/edit
  def edit
  end

  # POST /user_favs or /user_favs.json
  def create
    @user_fav = UserFav.new(user_fav_params)

    respond_to do |format|
      if @user_fav.save
        format.html { redirect_to @user_fav, notice: "User fav was successfully created." }
        format.json { render :show, status: :created, location: @user_fav }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_fav.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_favs/1 or /user_favs/1.json
  def update
    respond_to do |format|
      if @user_fav.update(user_fav_params)
        format.html { redirect_to @user_fav, notice: "User fav was successfully updated." }
        format.json { render :show, status: :ok, location: @user_fav }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_fav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_favs/1 or /user_favs/1.json
  def destroy
    @user_fav.destroy
    respond_to do |format|
      format.html { redirect_to user_favs_url, notice: "User fav was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_fav
      @user_fav = UserFav.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_fav_params
      params.require(:user_fav).permit(:user_id, :location_id)
    end
end
