class TicketSerializer
  include JSONAPI::Serializer
  belongs_to :tickets_of, polymorphic: true
end
