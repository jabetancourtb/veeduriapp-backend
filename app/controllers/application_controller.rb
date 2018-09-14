class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def authenticate_normal_user!
      redirect_to root_path unless user_signed_in? && current_user.is_normal_user?
    end    

    def authenticate_admin!
      redirect_to root_path unless user_signed_in? && current_user.is_admin?
    end   
  
    def configure_permitted_parameters
      #devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:name, :cc)}
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cc])
    end
end
