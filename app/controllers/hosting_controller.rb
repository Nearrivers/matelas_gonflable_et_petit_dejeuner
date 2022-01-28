class HostingController < ApplicationController
  before_action :authenticate_user!, :check_if_already_host
  skip_before_action  :verify_authenticity_token
  # GET OR POST /hosting or /hosting.json
  def index
    if request.post?
      set_user_host
    end
  end

  def set_user_host
    current_user.is_host = true;
    if current_user.save
      # success message
      flash[:success] = "Vous avez un accès hôte"
      # redirect to index
      redirect_to locations_path
    else
      # error message
      flash.now[:error] = "Une erreur est survenue en vous donnant l'accès hôte"
      render hosting_path
    end
  end

  def check_if_already_host
    if current_user.is_host
      redirect_to host_space_path
    end
  end

end
