class ProjectsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_publication, except: [:index, :new, :create, :my_publications]

    def index
        @projects = Project.order("updated_at DESC")
    end

    
    def show
        @project.update_visits_count
    end


    def new
        @project = Project.new
    end


    def create
        @project = current_user.project.new(project_params) 

        if @project.save
            redirect_to @project
            puts "Guardado con exito"
        elsif
            redirect_to '/projects/new/'
            puts "No se guardo :C"
        end
    end
    

    def update
        if @project.update(project_params)
            redirect_to @project
        elsif
            render :edit
        end
    end


    def destroy
        @project.destroy
        #redirect_to "#{projects_path}/my_publications/#{current_user.id}"
    end

    def my_publications
        if current_user.id.to_s == params[:user_id]
            
            @projects = Project.select(Project.arel_table[Arel.star]).where(User.arel_table[:id].eq(current_user.id))
            .joins(Project.arel_table.join(User.arel_table)
            .on(User.arel_table[:id].eq(Project.arel_table[:user_id])).join_sources)

            @projects_account = Project.select(Arel.star.count).where(User.arel_table[:id].eq(current_user.id))
            .joins(Project.arel_table.join(User.arel_table)
            .on(User.arel_table[:id].eq(Project.arel_table[:user_id])).join_sources)

        elsif
            redirect_to '/projects/' 
        end        
    end


    private

    def set_project
        @project = Project.find(params[:id])
    end

    def project_params
       params.require(:project).permit(:title, :information, :name, :description, :photo)
    end

    
    def validate_user
        redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
    end

end