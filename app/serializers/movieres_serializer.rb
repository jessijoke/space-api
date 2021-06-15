class MovieresSerializer
    include JSONAPI::Serializer
    attributes :name, :movie1, :movie2, :movie3, :total, :reservation_number
  end
  