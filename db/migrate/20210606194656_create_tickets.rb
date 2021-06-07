class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :ticket_type
      t.integer :reservation_id

      t.timestamps
    end
  end
end
