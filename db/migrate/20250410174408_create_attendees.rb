class CreateAttendees < ActiveRecord::Migration[7.1]
  def change
    create_table :attendees do |t|
      t.references :room
      t.string :name
      t.timestamps
    end
  end
end
