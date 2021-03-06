class TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]

    def index
        @tickets = Ticket.all 
    end

    def new 
        @ticket = Ticket.new
        # if @end_user
        #     @id = @end_user.id
        # else
        #     @id = nil
        # end
    end

    def create
        @ticket = Ticket.new(ticket_params)
       
        if @ticket.save
            redirect_to tickets_path
        else 
            render :new
        end
    end

    def show       
       # implicit 
    end

    def edit
        
    end

    def update
        if @ticket.update(ticket_params)
            redirect_to ticket_path(@ticket)
        else 
            render :edit
        end
    end

    def destroy
        @ticket.destroy
        redirect_to tickets_path
    end

    private

    def set_ticket
        @ticket = Ticket.find(params[:id])
    end

    def ticket_params
        params.require(:ticket).permit(:ticket_number, :asset, :issue, :priority, :end_user_id, :technician_id)
    end
end
