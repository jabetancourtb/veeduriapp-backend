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
            @publication = Publication.find(params[:id])
            @publication_user_name = User.select(User.arel_table[:name]).where(Publication.arel_table[:id].eq(params[:id])).joins(:publication)
            @publication_user_email = User.select(User.arel_table[:email]).where(Publication.arel_table[:id].eq(params[:id])).joins(:publication)
        elsif
            redirect_to '/'  
        end
    end


    def new
        if user_signed_in?
            @publication = Publication.new
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
            # redirect_to @publications

            if @publications.save
                redirect_to @publications
            elsif
                redirect_to '/publications/new/'
            end

        elsif
            redirect_to '/'  
        end
    end
    

    def my_publications
        if user_signed_in? and current_user.id.to_s == params[:user_id]
            
            @publications = Publication.select(Publication.arel_table[Arel.star]).where(User.arel_table[:id].eq(current_user.id))
            .joins(Publication.arel_table.join(User.arel_table)
            .on(User.arel_table[:id].eq(Publication.arel_table[:user_id])).join_sources)

            @publications_account = Publication.select(Arel.star.count).where(User.arel_table[:id].eq(current_user.id))
            .joins(Publication.arel_table.join(User.arel_table)
            .on(User.arel_table[:id].eq(Publication.arel_table[:user_id])).join_sources)

            puts @publications_account

        elsif
            redirect_to '/publications/' 
        end        
    end

end