class TicketsPolymorphicAssociation < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :tickets_of_id, :integer
    add_column :tickets, :tickets_of_type, :string
  end
end
