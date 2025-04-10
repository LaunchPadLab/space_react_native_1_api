class CreateVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.references :rooms_venues, null: false, foreign_key: true
      t.references :attendee, null: false, foreign_key: true
      t.timestamps
    end
  end
end
