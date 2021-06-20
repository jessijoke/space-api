class CreateCafeRes < ActiveRecord::Migration[6.1]
  def change
    create_table :caferes do |t|
      t.string :name
      t.integer :total
      t.integer :reservation_number
      t.integer :meal1
      t.integer :meal2
      t.integer :meal3
      t.timestamps
    end
  end
end
