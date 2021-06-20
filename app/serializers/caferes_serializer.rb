class CaferesSerializer
    include JSONAPI::Serializer
    attributes :name, :meal1, :meal2, :meal3, :total, :reservation_number
    has_many :tickets, as: :tickets_of
  end