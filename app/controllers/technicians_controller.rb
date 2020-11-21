class TechniciansController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]
#     before_action :authenticate_user!
    #   before_action :set_tech

    def index
        @technicians = Technician.all 
    end



    private

    def set_tech
        @technician = Technician.find(params[:id])
    end

    def tech_params
        @permitted = params.require(:name).permit(:name, :department, :cert_level, :email)
    end
end