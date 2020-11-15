class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
    #before_action :authenticate_admin!#, only: [:action]
    rescue_from ActiveRecord::RecordNotFound, with: :not_found 
    def not_found
        flash[:error] = "Not Found"
        redirect_to root_path
    end 

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:date_of_birth])  #correct the params for my schema 
    end
end
