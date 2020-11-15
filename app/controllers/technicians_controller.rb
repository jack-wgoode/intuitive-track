class TechniciansController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]
#     before_action :authenticate_user!
      before_action :set_tech

    def index
        @technicians = Technician.all 
    end

    private

    def set_tech
        @technician = Technician.find(params[:id])
    end

    def tech_params
        permitted = params.require(:name).permit(:name, :department, :cert_level, :email)
    end
end


#example code
# class DrinkOrdersController < ApplicationController
#     before_action :set_order, only: [:show, :edit, :update, :destroy]
#     before_action :authenticate_user!
#     #before_action :set_drink
#     def index
#       @orders = DrinkOrder.all #not sure why i can't use current_user.orders here  
#     end
#     def new
#       if params[:drink_id]
#         set_drink
#         @order = DrinkOrder.new(drink_id: params[:drink_id])
#       else
#         @order = DrinkOrder.new
#       end  
#     end
#     def show
#       @orders = current_user.drink_orders.find(params[:id])
#     end
#     def edit
#       set_order
#     end
#     def create
#       @order = current_user.drink_orders.build(drink_order_params)
#       if @order.save
#         redirect_to drink_order_path(@order)
#       else
#         render :new
#       end
#     end
#     def update
#       if @order.update(drink_order_params)
#         redirect_to drink_order_path(@order)
#       else
#         render :edit 
#       end
#     end
#     def destroy
#      @order.destroy
#      redirect_to drink_orders_path
#     end
#     private
#     def set_order
#       @order = DrinkOrder.find(params[:id])
#     end
#     def set_drink
#       @drink = Drink.find(params[:drink_id])
#     end
#     def drink_order_params
#       params.require(:drink_order).permit(:user_id, :drink_id, :special_instructions, :quantity, :name)
#     end 
#   end
#   10:15
#   class DrinksController < ApplicationController
#       before_action :set_drink, only: [:show, :edit, :update, :destroy]
#       before_action :authenticate_user! 
#       def index
#         @drinks = current_user.drinks   
#       end
#       def new
#         @drink = Drink.new
#       end
#       def show
#         @drinks = Drink.find(params[:id])
#       end
#       def edit
#       end
#       def create
#         @drink = current_user.drinks.build(drink_params)
#         if @drink.save
#           redirect_to drink_path(@drink)
#         else
#           render :new
#         end
#       end
#       def update
#          if @drink.update(drink_params)
#            redirect_to drink_path(@drink)
#          else
#            render :edit 
#          end
#       end
#       def destroy
#        @drink.destroy
#        redirect_to drinks_path
#       end
#       private
#       def set_drink
#           @drink = Drink.find(params[:id])
#       end 
#       def drink_params
#           params.require(:drink).permit(:name, :ingredients, :price)
#       end 
#   end