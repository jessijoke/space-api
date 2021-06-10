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

    def create
        reservation = Reservation.new(reservation_params)
        adultTickets = params[:trAdult].to_i
        childTickets = params[:trChild].to_i
        seniorTicket = params[:trSenior].to_i
        vetTickets = params[:trVet].to_i
        reservation.reservation_number = generate_number

        if reservation.save
            resID = reservation.id
            puts "reservation if is #{resID}"
            create_ticket("adult", adultTickets, resID)
            create_ticket("child", childTickets, resID)
            create_ticket("senior", seniorTicket, resID)
            create_ticket("vet", vetTickets, resID)
            render json: reservation
        else
            render json: { message: 'Something went wrong' }
        end
    end

    def look_up_reservation
        reservation = Reservation.where(:reservation_number => params[:reservation_number])
        if reservation
            render json: ReservationSerializer.new(reservation)
        else
            render json: { message: 'Reservation not found' }
        end
    end

    private
    def set_reservation
        reservation = Reservation.find(params[:id])
      end

    def reservation_params
        params.require(:reservation).permit(:name, :wheelchair, :ald, :total, :trAdult, :trChild, :trSenior, :trVet, :reservation_number)
    end

    def create_ticket(ticket_type, amount, id)
        x = amount
        puts "id is equal to #{id}"
        while x > 0
            Ticket.create(ticket_type: ticket_type, reservation_id: id)
            x -= 1
        end
    end

    def generate_number
        loop do
            number = SecureRandom.random_number(10000000)
            
            break number unless Reservation.where(reservation_number: number).exists?
        end
    end
end
