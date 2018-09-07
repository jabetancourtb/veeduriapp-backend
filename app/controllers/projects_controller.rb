class ProjectsController < ApplicationController
    def index

        if user_signed_in?
            #@projects = Project.all
            @projects = Project.order("updated_at DESC")
        elsif
            redirect_to '/'  
        end
    end

    
    def show

        if user_signed_in?
            @project = Project.find(params[:id])
        elsif
            redirect_to '/'  
        end

    end
end