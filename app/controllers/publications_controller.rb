class PublicationsController < ApplicationController

    def index
        if user_signed_in?
            @publications = Publication.order("updated_at DESC")
            
            
            # @pub_id = Publication.select("id")
            # current_user.id
            # @publication_user = User.joins(:publication).select("name")
            # @publication_user = User.select(User.arel_table[:name]).where(Publication.arel_table[:user_id].eq(@pub_id)).joins(:publication)
            # User.select(User.arel_table[:name]).where(Publication.arel_table[:user_id]).joins(:publications)
            # @publication_user = Publication.joins(:user).select("name")

            # puts @publication_user

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


    def new
        if user_signed_in?
            @publications = Publication.new
        elsif
            redirect_to '/'  
        end
    end


    def create
        if user_signed_in?
            @publications = Publication.new(title: params[:publication][:title], 
            description: params[:publication][:description],
            information: params[:publication][:information],
            photo: params[:publication][:photo],
            user_id: current_user.id)

            @publications.save
            redirect_to @publications
        elsif
            redirect_to '/'  
        end
    end

end