class CreateRoomsAndVenues < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :invite_code
      t.integer :host_id
      t.integer :status

      t.timestamps
    end

    create_table :venues do |t|
      t.integer :cost
      t.string :menu_link
      t.integer :rating
      t.integer :category_id

      t.timestamps
    end

    create_table :rooms_venues do |t|
      # Intentionally keeping the id column to reference at vote time
      t.belongs_to :room
      t.belongs_to :venue
    end
  end
end
