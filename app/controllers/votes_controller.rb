class VotesController < ApplicationController
  def create
    rooms_venues_id = RoomVenue.find_by(venue_id: vote_params[:venue_id],
                                        room_id: vote_params[:room_id]).id

    @vote = Vote.new(rooms_venues_id:, attendee_id: vote_params[:attendee_id])
    if @vote.save
      render json: { message: 'Vote registered successfully' }, status: :created
    else
      render json: { errors: @vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def vote_params
    params.require(:vote).permit(:room_id, :venue_id, :attendee_id)
  end
end
