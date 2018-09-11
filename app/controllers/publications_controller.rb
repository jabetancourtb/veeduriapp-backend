class PublicationsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]

    def index
        @publications = Publication.order("updated_at DESC")
    end
    

    def show
        @publication = Publication.find(params[:id])
        # @publication_user_name = User.select(User.arel_table[:name]).where(Publication.arel_table[:id].eq(params[:id])).joins(:publication)
        # @publication_user_email = User.select(User.arel_table[:email]).where(Publication.arel_table[:id].eq(params[:id])).joins(:publication)
    end


    def new
        @publication = Publication.new
    end


    def create
        # @publication = current_user.publication.new(title: params[:publication][:title], 
        # description: params[:publication][:description],
        # information: params[:publication][:information],
        # photo: params[:publication][:photo],
        # user_id: current_user.id)

         @publication = current_user.publication.new(publication_params) # Doesn't work it because the user_id is unknown
        
        # @publication.save
        # redirect_to @publications

        if @publication.save
            redirect_to @publication
            puts "Guardado con exito"
        elsif
            redirect_to '/publications/new/'
            puts "No se guardo :C"
        end
    end
    

    def edit
        @publication = Publication.find(params[:id])
    end


    def update
        @publication = Publication.find(params[:id])

        # if @publication.update(title: params[:publication][:title], 
        #     description: params[:publication][:description],
        #     information: params[:publication][:information],
        #     photo: params[:publication][:photo],
        #     user_id: current_user.id)
        if @publication.update(publication_params)
            redirect_to @publication
        elsif
            render :edit
        end
    end


    def destroy
        @publication = Publication.find(params[:id])
        @publication.destroy
        redirect_to "#{publications_path}/my_publications/#{current_user.id}"
    end

    def my_publications
        if current_user.id.to_s == params[:user_id]
            
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


    def publication_params
       params.require(:publication).permit(:title, :description, :information, :photo)
    end

    
    def validate_user
        redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
    end

end