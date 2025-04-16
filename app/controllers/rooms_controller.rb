class RoomsController < ApplicationController
  include RoomInviteCodifier

  def create
    @room = Room.new(create_room_params.merge(invite_code: new_room_invite_code, status: :open))
    ActiveRecord::Base.transaction do
      if @room.save
        @host = Attendee.new(room_id: @room.id, name: host_params[:name])
        render :create, status: :created if @host.save
      else
        @errors = @room.errors.full_messages
        render 'shared/errors', status: :unprocessable_entity
      end
    end
  end

  def show
    @room = Room.find_by(id: params[:id]) || Room.find_by(invite_code: params[:id])
    @attendees = @room.attendees
    @venues = @room.venues
    @room_venue_by_id = RoomVenue.where(room_id: @room.id).index_by(&:id)
    @votes = Vote.where(rooms_venues_id: @room_venue_by_id.keys)

    render :show, status: :ok
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(update_room_status_params)
      render :update, status: :ok
    else
      @errors = @room.errors.full_messages
      render 'shared/errors', status: :unprocessable_entity
    end
  end

  def update_room_status_params
    params.require(:room)
          .permit(:status)
  end

  def create_room_params
    params
      .require(:room)
      .permit(:name, venue_ids: [])
  end

  def host_params
    params.require(:host)
          .permit(:name)
  end
end
