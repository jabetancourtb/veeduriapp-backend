class UsersController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_user, except: [:index, :show, :new, :create, :my_publications]
    before_action :authenticate_admin! , only: [:index, :new, :create, :update, :edit, :destroy]

    def index
        @users = User.all
        #@publications = current_user.publication.all
    end
    

    def show
        #if current_user.id.to_s == params[:id]
            @user = User.find(current_user.id) 
            #@user = User.find(params[:id]) 
        #elsif
         #   redirect_to "/users/#{current_user.id}"
        #end
    end

    
    private

    def set_user
        @user = User.find(params[:id])
    end


    def user_params
       params.require(:user).permit(:email, :name, :cc, :permission_level)
    end

    
    def validate_user
        redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
    end

end