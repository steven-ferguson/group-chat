class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def new 
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatrooms_path, notice: "Chatroom successfully created!"
    else
      render 'new'
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
  end

private
  def chatroom_params
    params.require(:chatroom).permit(:name, :owner_id)
  end

end