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

    def create
        ticket = Ticket.new

        if ticket.save
            render json: ticket
        else
            render json: { message: 'Something went wrong' }
        end
    end

    private
    def set_ticket
        ticket = Ticket.find(params[:id])
      end

    def ticket_params
        params.require(:ticket).permit(:ticket_type)
    end
end
