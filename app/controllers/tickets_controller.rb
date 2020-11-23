class TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]

    def index
        @tickets = Ticket.all 
    end

    def new 
        @technician = Ticket.new
        # if @end_user
        #     @id = @end_user.id
        # else
        #     @id = nil
        # end
    end

    def create
        @technician = Ticket.new(ticket_params)
       
        if @technician.save
            
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
        if @technician.update(ticket_params)
            redirect_to technician_path(@technician)
        else 
            render :edit
        end
    end

    def destroy
        @technician.destroy
        redirect_to technician_path
    end

    private

    def set_ticket
        @technician = Ticket.find(params[:id])
    end

    def ticket_params
        params.require(:ticket).permit(:ticket_number, :asset, :issue, :priority, :end_user_id, :technician_id)
    end
end
