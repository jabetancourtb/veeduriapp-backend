class UsersController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_user, except: [:index, :show, :new, :create, :my_publications]
    before_action :authenticate_admin! , only: [:index, :new, :create, :update, :edit, :destroy]

    def index
        @users = User.all
        #@publications = current_user.publication.all
    end
    

    def show
        if current_user.id.to_s == params[:id]
            @user = User.find(params[:id]) 
        elsif
            redirect_to "/users/#{current_user.id}"
        end
    end


    # def new
    #     @publication = Publication.new
    # end


    # def create
    #     @publication = current_user.publication.new(publication_params) 

    #     if @publication.save
    #         redirect_to @publication
    #         puts "Guardado con exito"
    #     elsif
    #         redirect_to '/publications/new/'
    #         puts "No se guardo :C"
    #     end
    # end
    

    # def edit
    #    # @publication = Publication.find(params[:id])
    # end


    # def update
    #     #@publication = Publication.find(params[:id])

    #     if @publication.update(publication_params)
    #         redirect_to @publication
    #     elsif
    #         render :edit
    #     end
    # end


    # def destroy
    #     #@publication = Publication.find(params[:id])
    #     @publication.destroy
    #     redirect_to "#{publications_path}/my_publications/#{current_user.id}"
    # end

    # def my_publications
    #     if current_user.id.to_s == params[:user_id]
            
    #         # @publications = Publication.select(Publication.arel_table[Arel.star]).where(User.arel_table[:id].eq(current_user.id))
    #         # .joins(Publication.arel_table.join(User.arel_table)
    #         # .on(User.arel_table[:id].eq(Publication.arel_table[:user_id])).join_sources)
    #         @publications = current_user.publication.all

    #         @publications_account = Publication.select(Arel.star.count).where(User.arel_table[:id].eq(current_user.id))
    #         .joins(Publication.arel_table.join(User.arel_table)
    #         .on(User.arel_table[:id].eq(Publication.arel_table[:user_id])).join_sources)

    #     elsif
    #         redirect_to "/publications/my_publications/#{current_user.id}"
    #     end        
    # end


    private

    def set_user
        @user = User.find(params[:id])
    end

    # def publication_params
    #    params.require(:publication).permit(:title, :description, :information, :photo, :cover)
    # end

    
    def validate_user
        redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
    end

end