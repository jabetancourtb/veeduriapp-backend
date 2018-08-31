class PublicationsController < ApplicationController
    def index

        if user_signed_in?
            @publications = Publication.order("updated_at DESC")
        elsif
            redirect_to '/'  
        end
    end
    

    def show

        if user_signed_in?
            @publications = Publication.find(params[:id])
        elsif
            redirect_to '/'  
        end

    end
end