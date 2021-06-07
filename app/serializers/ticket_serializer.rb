class TicketSerializer
  include JSONAPI::Serializer
  attributes :ticket_type
  belongs_to :reservation
end
