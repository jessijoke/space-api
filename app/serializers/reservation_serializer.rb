class ReservationSerializer
  include JSONAPI::Serializer
  attributes :name, :wheelchair, :ald, :total, :reservation_number
  has_many :tickets, as: :tickets_of

end
