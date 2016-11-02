class RoomsController < ApplicationController

  def create
    @room = Room.new(room_params)

    if @room.save
      flash[:success] = 'New room created!'
    else
      flash[:error] = @room.errors.full_messages.to_s
    end

    redirect_to root_path

  end

  private
    def room_params
      params.require(:room).permit(:name)
    end

end
