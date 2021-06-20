class CaferesController < ApplicationController
    def index
        caferes = Cafere.all
        render json: CaferesSerializer.new(caferes)
    end

    def show
        caferes = Cafere.find_by(id: params[:id])
        if movieres
            render json: CaferesSerializer.new(caferes)
        else
            render json: { message: 'Movie Reservation not found' }
        end
    end

    def create
        caferes = Cafere.new(reservation_params)
        adultTickets = params[:crAdult].to_i
        childTickets = params[:crChild].to_i
        seniorTicket = params[:crSenior].to_i
        vetTickets = params[:crVet].to_i
        caferes.reservation_number = generate_number

        if caferes.save
            resID = caferes.id
            #puts "reservation if is #{resID}"
            create_ticket("adult", adultTickets, resID)
            create_ticket("child", childTickets, resID)
            create_ticket("senior", seniorTicket, resID)
            create_ticket("vet", vetTickets, resID)
            #puts "we're back to the main function"
            render json: CaferesSerializer.new(caferes)
           # puts "we rendered the json"
        else
            render json: { message: 'Something went wrong' }
        end
    end

    def look_up_reservation
        caferes = Cafere.where(:reservation_number => params[:reservation_number])
        if caferes
            render json: CaferesSerializer.new(caferes)
        else
            render json: { message: 'Reservation not found' }
        end
    end

    private
    def set_reservation
        caferes = CaferesSerializer.find(params[:id])
      end

    def reservation_params
        params.require(:cafere).permit(:name, :meal1, :meal2, :meal3, :total, :crAdult, :crChild, :crSenior, :crVet, :reservation_number)
    end


    def create_ticket(ticket_type, amount, id)
        x = amount
        if x
            while x > 0
                Ticket.create(ticket_type: ticket_type, tickets_of_id: id, tickets_of_type: "Cafere")
                x -= 1
            end
        end
    end

    def generate_number
        loop do
            number = SecureRandom.random_number(10000000)
            
            break number unless Moviere.where(reservation_number: number).exists?
        end
    end
end
