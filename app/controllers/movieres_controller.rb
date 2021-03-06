class MovieresController < ApplicationController
    def index
        movieres = Moviere.all
        render json: MovieresSerializer.new(movieres)
    end

    def show
        movieres = Moviere.find_by(id: params[:id])
        if movieres
            render json: MovieresSerializer.new(movieres)
        else
            render json: { message: 'Movie Reservation not found' }
        end
    end

    def create
        movieres = Moviere.new(reservation_params)
        adultTickets = params[:mrAdult].to_i
        childTickets = params[:mrChild].to_i
        seniorTicket = params[:mrSenior].to_i
        vetTickets = params[:mrVet].to_i
        movieres.reservation_number = generate_number

        if movieres.save
            resID = movieres.id
            #puts "reservation if is #{resID}"
            create_ticket("adult", adultTickets, resID)
            create_ticket("child", childTickets, resID)
            create_ticket("senior", seniorTicket, resID)
            create_ticket("vet", vetTickets, resID)
            #puts "we're back to the main function"
            render json: MovieresSerializer.new(movieres)
           # puts "we rendered the json"
        else
            render json: { message: 'Something went wrong' }
        end
    end

    def look_up_reservation
        movieres = Moviere.where(:reservation_number => params[:reservation_number])
        if movieres
            render json: MovieresSerializer.new(movieres)
        else
            render json: { message: 'Reservation not found' }
        end
    end

    private
    def set_reservation
        movieres = ReservationSerializer.find(params[:id])
      end

    def reservation_params
        params.require(:moviere).permit(:name, :movie1, :movie2, :movie3, :total, :mrAdult, :mrChild, :mrSenior, :mrVet, :reservation_number)
    end


    def create_ticket(ticket_type, amount, id)
        x = amount
        #puts "id is equal to #{id}"
        if x
            while x > 0
                Ticket.create(ticket_type: ticket_type, tickets_of_id: id, tickets_of_type: "Moviere")
                x -= 1
                #puts "we got this far"
            end
        end
        #puts "and this far"
    end

    def generate_number
        loop do
            number = SecureRandom.random_number(10000000)
            
            break number unless Moviere.where(reservation_number: number).exists?
        end
    end
end
