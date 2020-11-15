class TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]

    def index
        @tickets = Ticket.all 
    end

    def new
        @ticket = Ticket.new(end_user_id: params[:end_user_id])
    end

    def create
        @ticket = current_technician.tickets.build(ticket_params)
        if @ticket.save
            redirect_to ticket_path(@ticket)
        else 
            render :new
        end
    end

    def show       
       # implicit 
    end

    def edit
        if @ticket.technician.id == current_technician.id
            render :edit
        else
            redirect_to ticket_path(@ticket)
        end
    end

    def update
        if @ticket.update(ticket_params)
            redirect_to ticket_path(@ticket)
        else 
            render :edit
        end
    end

    def destroy
        if @ticket.technician.id == current_technician.id
            @ticket.destroy
            redirect_to tickets_path
        else
            redirect_to ticket_path(@ticket)
        end
    end

    private

    def set_ticket
        @ticket = Ticket.find(params[:id])
    end

    def ticket_params
        params.require(:ticket).permit(:ticket_number, :asset, :issue, :priority, :end_user_id)
    end



end
