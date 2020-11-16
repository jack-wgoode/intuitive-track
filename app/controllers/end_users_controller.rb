class EndUsersController < ApplicationController
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]

    def index
        @end_users = end_user.all 
    end

    def new
        @end_user = EndUser.new
    end

    def create
        @end_user = EndUser.new(end_user_params)
        
        if @end_user.save
            redirect_to end_users_path
        else 
            render :new
        end
    end

    def show       
       # implicit 
    end

    def edit
        if @end_user.technician.id == current_technician.id
            render :edit
        else
            redirect_to ticket_path(@end_user)
        end
    end

    def update
        if @end_user.update(ticket_params)
            redirect_to ticket_path(@end_user)
        else 
            render :edit
        end
    end

    def destroy
        if @end_user.technician.id == current_technician.id
            @end_user.destroy
            redirect_to tickets_path
        else
            redirect_to ticket_path(@end_user)
        end
    end

    private

    def set_end_user
        @end_user = end_user.find(params[:id])
    end

    def end_user_params
        params.require(:end_user).permit(:name, :employee_number, :department, :email)
    end


end
