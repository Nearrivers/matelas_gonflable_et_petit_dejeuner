class LOptionsController < ApplicationController
  before_action :set_l_option, only: %i[ show edit update destroy ]

  # GET /l_options or /l_options.json
  def index
    @l_options = LOption.all
  end

  # GET /l_options/1 or /l_options/1.json
  def show
  end

  # GET /l_options/new
  def new
    @l_option = LOption.new
  end

  # GET /l_options/1/edit
  def edit
  end

  # POST /l_options or /l_options.json
  def create
    @l_option = LOption.new(l_option_params)

    respond_to do |format|
      if @l_option.save
        format.html { redirect_to @l_option, notice: "L option was successfully created." }
        format.json { render :show, status: :created, location: @l_option }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @l_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /l_options/1 or /l_options/1.json
  def update
    respond_to do |format|
      if @l_option.update(l_option_params)
        format.html { redirect_to @l_option, notice: "L option was successfully updated." }
        format.json { render :show, status: :ok, location: @l_option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @l_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /l_options/1 or /l_options/1.json
  def destroy
    @l_option.destroy
    respond_to do |format|
      format.html { redirect_to l_options_url, notice: "L option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_l_option
      @l_option = LOption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def l_option_params
      params.require(:l_option).permit(:value)
    end
end
