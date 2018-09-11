class StatePublicationsController < ApplicationController
  before_action :set_state_publication, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /state_publications
  # GET /state_publications.json
  def index
    @state_publications = StatePublication.all
  end

  # GET /state_publications/1
  # GET /state_publications/1.json
  def show
  end

  # GET /state_publications/new
  def new
    @state_publication = StatePublication.new
  end

  # GET /state_publications/1/edit
  def edit
  end

  # POST /state_publications
  # POST /state_publications.json
  def create
    @state_publication = StatePublication.new(state_publication_params)

    respond_to do |format|
      if @state_publication.save
        format.html { redirect_to @state_publication, notice: 'State publication was successfully created.' }
        format.json { render :show, status: :created, location: @state_publication }
      else
        format.html { render :new }
        format.json { render json: @state_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /state_publications/1
  # PATCH/PUT /state_publications/1.json
  def update
    respond_to do |format|
      if @state_publication.update(state_publication_params)
        format.html { redirect_to @state_publication, notice: 'State publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @state_publication }
      else
        format.html { render :edit }
        format.json { render json: @state_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /state_publications/1
  # DELETE /state_publications/1.json
  def destroy
    @state_publication.destroy
    respond_to do |format|
      format.html { redirect_to state_publications_url, notice: 'State publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state_publication
      @state_publication = StatePublication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_publication_params
      params.require(:state_publication).permit(:user_id, :publication_id, :comment, :state)
    end
end
