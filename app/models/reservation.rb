class Reservation < ApplicationRecord
    #attr_accessor :id, :name, :wheelchair, :ald, :total, :reservation_number
    has_many :tickets, :dependent => :destroy
end
