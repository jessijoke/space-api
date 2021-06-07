class TicketsController < ApplicationController
    def index
        tickets = Ticket.all
        render json: tickets, except: [:created_at, :updated_at]
    end

    def show
        ticket = Ticket.find_by(id: params[:id])
        if ticket
            render json: ticket, except: [:created_at, :updated_at]
        else
            render json: { message: 'Ticket not found' }
        end
    end
end
