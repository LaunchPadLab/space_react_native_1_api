class AttendeesController < ApplicationController
  def create
    @room = Room.find_by(invite_code: create_attendee_room_params[:invite_code], status: :open)
    @attendee = Attendee.new(create_attendee_params.merge(room: @room))

    if @attendee.save
      render :create, status: :created
    else
      @errors = @attendee.errors.full_messages
      render 'shared/errors', status: :unprocessable_entity
    end
  end

  def create_attendee_params
    params.require(:attendee)
          .permit(:name)
  end

  def create_attendee_room_params
    params.require(:room)
          .permit(:invite_code)
  end
end
