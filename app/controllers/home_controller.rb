class HomeController < ApplicationController
  def index
    @rooms = Room.all
    @new_room = Room.new
  end

  def login
    if params[:username].presence
      session[:username] = params[:username]
      flash[:success] = 'Added identiy username as ' + params[:username]
    else
      flash[:error] = 'Identiy username must not null'
    end

    redirect_back fallback_location: root_path
  end

  def logout
    session[:username] = nil
    flash[:success] = 'Logout successfully'
    redirect_back fallback_location: root_path
  end
end
