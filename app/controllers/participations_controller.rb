class ParticipationsController < ApplicationController
  def new
    @participation = Participation.new(chatroom_id: params[:chatroom_id])
    if can? :create, @participation
      render 'new'
    else
      redirect_to chatroom_path(@participation.chatroom), alert: "Unauthorized"
    end
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user 
      @participation = user.participations.create(participation_params)
      redirect_to chatroom_path(@participation.chatroom), notice: "Friend(s) added successfully!"
    else
      flash.now[:alert] = "User does not exist"
      render 'new'
    end
  end

private

  def participation_params
    params.require(:participation).permit(:chatroom_id)
  end
end
