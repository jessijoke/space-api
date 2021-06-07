class ReservationsController < ApplicationController
    def index
        reservations = Reservation.all
        render json: ReservationSerializer.new(reservations)
    end

    def show
        reservation = Reservation.find_by(id: params[:id])
        if reservation
            render json: ReservationSerializer.new(reservation)
        else
            render json: { message: 'Reservation not found' }
        end
    end
end
