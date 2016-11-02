class HomeController < ApplicationController
  def index
    @rooms = Room.all
    @new_room = Room.new
  end
end
