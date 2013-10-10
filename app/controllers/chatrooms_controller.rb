class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
    if can? :create, @chatroom
      render 'new'
    else
      redirect_to root_path, alert: "Unauthorized"
    end
  end

  def create
    @chatroom = current_user.owned_chatrooms.new(chatroom_params)
    if @chatroom.save
      redirect_to chatrooms_path, notice: "Chatroom successfully created!"
    else
      render 'new'
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    if can? :read, @chatroom
      render 'show'
    else
      redirect_to root_path, alert: "Unauthorized"
    end
  end

private
  def chatroom_params
    params.require(:chatroom).permit(:name, :owner_id, :users)
  end

end