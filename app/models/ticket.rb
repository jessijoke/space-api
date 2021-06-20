class Ticket < ApplicationRecord
    #belongs_to :reservation
    belongs_to :tickets_of, polymorphic: true
end
