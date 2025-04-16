class CreateRoomsAndVenues < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :invite_code
      t.integer :host_id
      t.integer :status

      t.timestamps
    end

    create_table :venues do |t|
      t.string :name
      t.string :instagram_link
      t.string :menu_link
      t.integer :cost
      t.integer :rating
      t.integer :category
      t.decimal :lat, :precision => 10, :scale => 6
      t.decimal :lng, :precision => 10, :scale => 6

      t.timestamps
    end

    create_table :rooms_venues do |t|
      # Intentionally keeping the id column to reference at vote time
      t.belongs_to :room
      t.belongs_to :venue
    end
  end
end
