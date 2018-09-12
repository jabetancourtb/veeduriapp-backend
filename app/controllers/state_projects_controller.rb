class StateProjectsController < ApplicationController
  before_action :set_state_project, only: [:show, :edit, :update, :destroy]
  before_action :set_project
  before_action :authenticate_user!, except: [:index, :show]

  # GET /state_projects
  # GET /state_projects.json
  def index
    @state_projects = StateProject.all
  end

  # GET /state_projects/1
  # GET /state_projects/1.json
  def show
  end

  # GET /state_projects/new
  def new
    @state_project = StateProject.new
  end

  # GET /state_projects/1/edit
  def edit
  end

  # POST /state_projects
  # POST /state_projects.json
  def create
    @state_project = current_user.state_project.new(state_project_params)
    @state_project.project = @project

    respond_to do |format|
      if @state_project.save
        format.html { redirect_to @state_project.project, notice: 'State project was successfully created.' }
        format.json { render :show, status: :created, location: @state_project }
      else
        format.html { render :new }
        format.json { render json: @state_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /state_projects/1
  # PATCH/PUT /state_projects/1.json
  def update
    respond_to do |format|
      if @state_project.update(state_project_params)
        format.html { redirect_to @state_project.project, notice: 'State project was successfully updated.' }
        format.json { render :show, status: :ok, location: @state_project }
      else
        format.html { render :edit }
        format.json { render json: @state_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /state_projects/1
  # DELETE /state_projects/1.json
  def destroy
    @state_project.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'State project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_state_project
      @state_project = StateProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_project_params
      params.require(:state_project).permit(:user_id, :project_id, :comment, :state)
    end
end
