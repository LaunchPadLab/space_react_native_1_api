module RoomInviteCodifier
  extend ActiveSupport::Concern

  def new_room_invite_code
    code = nil
    while code.nil?
      code = SecureRandom.hex(3) # Generate a random 8-character hex string
      # Check if the generated code already exists in the database
      return code unless Room.where(invite_code: code, status: :open).any?
    end
  end
end
