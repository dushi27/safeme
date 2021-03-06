class JawbonesController < ApplicationController
  http_basic_authenticate_with name: ENV["SAFEME_NAME"], password: ENV["SAFEME_SECRET"], except: :create
  before_action :validate, only:[:create]
  skip_before_action :verify_authenticity_token, only: [:create]

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
    params[:events].each do |event|
      jawbone_params = {:user_xid => event['user_xid'],:action => event['action'],:data => params['events'].to_s,
      :timestamp => event['timestamp'].to_s, :jawbone_type => event['type']}
      @event = Jawbone.create(jawbone_params)
    end
    render :json => {:success => 200} 
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
    
    def validate
      render :json => {:status => 400} and return if params[:events].nil? or params[:secret_hash] != ENV['JAWBONE_SH']
    end
end
