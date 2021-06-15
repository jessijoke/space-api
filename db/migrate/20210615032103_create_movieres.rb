class CreateMovieres < ActiveRecord::Migration[6.1]
  def change
    create_table :movieres do |t|
      t.string :name
      t.integer :total
      t.integer :reservation_number
      t.integer :movie1
      t.integer :movie2
      t.integer :movie3

      t.timestamps
    end
  end
end
