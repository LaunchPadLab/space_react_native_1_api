class RoomsController < ApplicationController
  include RoomInviteCodifier
  def create
    @room = Room.new(create_room_params.merge(invite_code: new_room_invite_code, status: :open))
    if @room.save
      render :create, status: :created
    else
      @errors = @room.errors.full_messages
      render 'shared/errors', status: :unprocessable_entity
    end
  end

  def create_room_params
    params
      .require(:room)
      .permit(:name, venue_ids: [])
  end
end
