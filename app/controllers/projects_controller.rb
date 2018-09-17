class ProjectsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_project, except: [:index, :new, :create, :my_projects]
    before_action :authenticate_admin! , only: [:new, :create, :update, :edit, :destroy, :my_projects]

    def index
        @projects = Project.order("created_at DESC")
    end

    
    def show
        @project.update_visits_count
        @state_project = StateProject.new
        @comment_project = CommentProject.new
    end


    def new
        @project = Project.new
    end


    def create
        @project = current_user.project.new(project_params) 

        if @project.save
            redirect_to @project
        elsif
            redirect_to '/projects/new/'
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
        redirect_to "#{projects_path}/my_projects/#{current_user.id}"
    end

    def my_projects
        #if current_user.id.to_s == params[:user_id]
            
            @projects = current_user.project.all

            @projects_account = Project.select(Arel.star.count).where(User.arel_table[:id].eq(current_user.id))
            .joins(Project.arel_table.join(User.arel_table)
            .on(User.arel_table[:id].eq(Project.arel_table[:user_id])).join_sources)

        # elsif
        #     redirect_to "/projects/my_projects/#{current_user.id}"
        # end        
    end

    def create_notification(publication_id)
        @notification = Project.create(title:"Rendición de cuentas de Peñalosa de sus dos años de gobierno", information:"A esta hora en el colegio La Felicidad de la localidad de Fontibón, el alcalde Enrique Peñalosa entrega un balance de lo que han sido sus dos primeros años de gobierno en Bogotá.  
        El veedor Distrital, Jaime Torres-Melo, se anticipó al evento de rendición de cuentas y aunque destacó logros en 32 áreas estratégicas, advirtió que es preciso acelerar la ejecución de los recursos y solucionar temas clave como terminar la implementación del Sistema Integrado de Transporte Público (SITP).", 
        name:"Ficha EBI Proyecto 1035", description:"La Veeduría anticipó los datos: destaca 32 logros en áreas estratégicas, pide acelerar ejecución.", photo:"/assets/proyecto2", user_id: 1)
        #puts publication_id
        if @notification.save
            puts "HOLAAAAAA"
        end
    end


    private

    def set_project
        @project = Project.find(params[:id])
    end

    def project_params
       params.require(:project).permit(:title, :information, :name, :description, :photo, :cover)
    end

    
    def validate_user
        redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
    end

end