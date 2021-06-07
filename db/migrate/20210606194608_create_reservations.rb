class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.integer :wheelchair
      t.integer :ald
      t.integer :total
      t.integer :reservation_number

      t.timestamps
    end
  end
end
