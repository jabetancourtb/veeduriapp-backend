class CommentPublicationsController < ApplicationController
  before_action :set_comment_publication, only: [:show, :edit, :update, :destroy]
  before_action :set_publication
  before_action :authenticate_user!, except: [:index, :show]

  # GET /comment_publications
  # GET /comment_publications.json
  def index
    @comment_publications = CommentPublication.all
  end

  # GET /comment_publications/1
  # GET /comment_publications/1.json
  def show
  end

  # GET /comment_publications/new
  def new
    @comment_publication = CommentPublication.new
  end

  # GET /comment_publications/1/edit
  def edit
  end

  # POST /comment_publications
  # POST /comment_publications.json
  def create
    @comment_publication = current_user.comment_publication.new(comment_publication_params)
    @comment_publication.publication = @publication


    respond_to do |format|
      if @comment_publication.save
        format.html { redirect_to @comment_publication.publication, notice: 'Comment publication was successfully created.' }
        format.json { render :show, status: :created, location: @comment_publication.publication }
      else
        format.html { render :new }
        format.json { render json: @comment_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_publications/1
  # PATCH/PUT /comment_publications/1.json
  def update
    respond_to do |format|
      if @comment_publication.update(comment_publication_params)
        format.html { redirect_to @comment_publication.publication, notice: 'Comment publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_publication }
      else
        format.html { render :edit }
        format.json { render json: @comment_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_publications/1
  # DELETE /comment_publications/1.json
  def destroy
    @comment_publication.destroy
    respond_to do |format|
      format.html { redirect_to @publication, notice: 'Comment publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_publication
      @publication = Publication.find(params[:publication_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment_publication
      @comment_publication = CommentPublication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_publication_params
      params.require(:comment_publication).permit(:user_id, :publication_id, :comment)
    end
end
