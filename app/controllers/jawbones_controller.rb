class JawbonesController < ApplicationController
  before_action :set_jawbone, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
    
  def pubsub     
      if params[:some].present?
        render :json => {:success => 200} 
        return
      end
  end

  def index
    @jawbones = Jawbone.all
  end

  def show
  end

  def new
    @jawbone = Jawbone.new
  end

  def edit
  end

  def create
    @jawbone = Jawbone.new(jawbone_params)

    respond_to do |format|
      if @jawbone.save
           render :json => {:success => 200} 
        #format.html { redirect_to @jawbone, notice: 'Jawbone was successfully created.' }
        #format.json { render :show, status: :created, location: @jawbone }
      else
        format.html { render :new }
        format.json { render json: @jawbone.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @jawbone.update(jawbone_params)
        format.html { redirect_to @jawbone, notice: 'Jawbone was successfully updated.' }
        format.json { render :show, status: :ok, location: @jawbone }
      else
        format.html { render :edit }
        format.json { render json: @jawbone.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @jawbone.destroy
    respond_to do |format|
      format.html { redirect_to jawbones_url, notice: 'Jawbone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_jawbone
      @jawbone = Jawbone.find(params[:id])
    end

    def jawbone_params
      params.require(:jawbone).permit(:user_xid, :type, :action)
    end
end
