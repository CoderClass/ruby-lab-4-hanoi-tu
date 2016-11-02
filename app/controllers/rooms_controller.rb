class RoomsController < ApplicationController

  def show
    redirect_to room_messages_path(Room.find(params[:id]))
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      flash[:success] = 'New room created!'
    else
      flash[:error] = @room.errors.full_messages.to_sentence
    end

    redirect_to root_path
  end

  private
    def room_params
      params.require(:room).permit(:name)
    end

end
