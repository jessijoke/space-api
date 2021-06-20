class Cafere < ApplicationRecord
    has_many :tickets, as: :tickets_of, :dependent => :destroy
end
