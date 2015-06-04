class PubsubsController < ApplicationController
  before_action :set_pubsub, only: [:show, :edit, :update, :destroy]

  # GET /pubsubs
  # GET /pubsubs.json
  def index
    @pubsubs = Pubsub.all
  end

  # GET /pubsubs/1
  # GET /pubsubs/1.json
  def show
  end

  # GET /pubsubs/new
  def new
    @pubsub = Pubsub.new
  end

  # GET /pubsubs/1/edit
  def edit
  end

  # POST /pubsubs
  # POST /pubsubs.json
  def create
    @pubsub = Pubsub.new(pubsub_params)

    respond_to do |format|
      if @pubsub.save
        format.html { redirect_to @pubsub, notice: 'Pubsub was successfully created.' }
        format.json { render :show, status: :created, location: @pubsub }
      else
        format.html { render :new }
        format.json { render json: @pubsub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pubsubs/1
  # PATCH/PUT /pubsubs/1.json
  def update
    respond_to do |format|
      if @pubsub.update(pubsub_params)
        format.html { redirect_to @pubsub, notice: 'Pubsub was successfully updated.' }
        format.json { render :show, status: :ok, location: @pubsub }
      else
        format.html { render :edit }
        format.json { render json: @pubsub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pubsubs/1
  # DELETE /pubsubs/1.json
  def destroy
    @pubsub.destroy
    respond_to do |format|
      format.html { redirect_to pubsubs_url, notice: 'Pubsub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pubsub
      @pubsub = Pubsub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pubsub_params
      params.require(:pubsub).permit(:user_xid, :type, :action, :timestamp)
    end
end
