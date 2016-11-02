class MessagesController < ApplicationController

  def index
    @room = Room.find(params[:room_id])

    respond_to do |format|
        format.html {}
        format.json { render json: @room.messages }
        format.js {}
      end
  end

  def create
    @message = Message.new(message_params)
    @message.room_id = params[:room_id]
    if current_user
      @message.username = current_user
    end

    if ! @message.save
      flash[:error] = @message.errors.full_messages.to_sentence
    end

    redirect_back fallback_location: root_path
  end

  private
    def message_params
      params.require(:message).permit(:content, :username)
    end

end
