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
    @room = Room.find(params[:room_id])

    @message = @room.messages.build(message_params)
    if current_user
      @message.username = current_user
    end

    if ! @message.save
      flash[:error] = @message.errors.full_messages.to_sentence
    end

    ActionCable.server.broadcast 'messages', message: render_message(@message)
    head :ok

    # redirect_back fallback_location: root_path
  end

  private
    def message_params
      params.require(:message).permit(:content, :username)
    end

    def render_message(message)
      render partial: 'messages/message', locals: { message: message }
    end

end
