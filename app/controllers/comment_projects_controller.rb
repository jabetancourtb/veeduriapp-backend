class CommentProjectsController < ApplicationController
  before_action :set_comment_project, only: [:show, :edit, :update, :destroy]
  before_action :set_project
  before_action :authenticate_user!, except: [:index, :show]

  # GET /comment_projects
  # GET /comment_projects.json
  def index
    @comment_projects = CommentProject.all
  end

  # GET /comment_projects/1
  # GET /comment_projects/1.json
  def show
  end

  # GET /comment_projects/new
  def new
    @comment_project = CommentProject.new
  end

  # GET /comment_projects/1/edit
  def edit
  end

  # POST /comment_projects
  # POST /comment_projects.json
  def create
    @comment_project = current_user.comment_project.new(comment_project_params)
    @comment_project.project = @project

    respond_to do |format|
      if @comment_project.save
        format.html { redirect_to @comment_project.project, notice: 'Comment project was successfully created.' }
        format.json { render :show, status: :created, location: @comment_project.project }
      else
        format.html { render :new }
        format.json { render json: @comment_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_projects/1
  # PATCH/PUT /comment_projects/1.json
  def update
    respond_to do |format|
      if @comment_project.update(comment_project_params)
        format.html { redirect_to @comment_project.project, notice: 'Comment project was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_project }
      else
        format.html { render :edit }
        format.json { render json: @comment_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_projects/1
  # DELETE /comment_projects/1.json
  def destroy
    @comment_project.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Comment project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def find_state
    @follow_users = StateProject.select(Arel.star).where(
      StateProject.arel_table[:state].eq('follow').and(
        StateProject.arel_table[:project_id].eq(params[:project_id]).and(StateProject.arel_table[:user_id].not_eq(current_user.id))
    )
    )

    a =  @follow_users.inspect.split(", ")
    hash_user_id = {}
    hash_project_id = {}

    i=1
    j=1

    a.each do |e|
        if e.include? "user_id"
            value = e.split(": ")
            hash_user_id[value[0]+"_"+i.to_s] = value[1]
            i+=1
        end
    end

    a.each do |e|
        if e.include? "project_id"
            value = e.split(": ")
            hash_project_id[value[0]+"_"+j.to_s] = value[1]
            j+=1
        end
    end

    puts hash_user_id
    puts hash_project_id

  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment_project
      @comment_project = CommentProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_project_params
      params.require(:comment_project).permit(:user_id, :project_id, :comment)
    end
end
