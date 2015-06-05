class PubsubsController < ApplicationController
  #before_action :set_pubsub, only: [:show, :edit, :update, :destroy]

    
  def index
    @pubsubs = Pubsub.all
  end

    
  def show
  end

    
  def new
    @pubsub = Pubsub.new
  end

    
  def edit
  end

  def create
      data = params[:events]
      
      @pubsub = Pubsub.new(:user_xid => data[:user_xid], :type => data[:type])
=begin
    respond_to do |format|    
      if @pubsub.save
        format.html { redirect_to @pubsub, notice: 'Pubsub was successfully created.' }
        format.json { render :show, status: :created, location: @pubsub }
      else
        format.html { render :new }
        format.json { render json: @pubsub.errors, status: :unprocessable_entity }
      end
    end
=end
      if @pubsub.save
            render :json => {
      :user => 200
    }
      else
                      render :json => {
      :user => 200
    }
      end
          
  end

    
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

    
  def destroy
    @pubsub.destroy
    respond_to do |format|
      format.html { redirect_to pubsubs_url, notice: 'Pubsub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_pubsub
      @pubsub = Pubsub.find(params[:id])
    end

    
    def pubsub_params
      params.require(:pubsub).permit(:user_xid, :type, :action, :timestamp)
    end
end
