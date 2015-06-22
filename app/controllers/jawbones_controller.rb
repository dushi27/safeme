class JawbonesController < ApplicationController
  before_action :set_jawbone, only: [:show, :edit, :update, :destroy]
  include JawbonesHelper
  skip_before_action :verify_authenticity_token
  before_action :set_twillio_client, only: [:create]
           
  def pubsub 
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
    params[:events].each do |event|
      next if event[:action] == 'updation' or event[:action] == 'creation' # (Time.now.to_i - event[:timestamp] ) > 60 or
      @event = Jawbone.create(:user_xid => event[:user_xid], :action => event[:action], :data => params[:events].to_s)
        
          #if @event.save
           #   if should_alert?(@event) 
            #      puts "ALERT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"                  
             #     twilio_phone_number = ENV['TWILLIO_NUMBER']
              #    to_number = User.where(:xid => @event.user_xid).first.my_num
               #   message = @client.account.messages.create(
                #      :to => to_number,
                 #     :from => twilio_phone_number,                        
                  #    :body => "Safe.me recognized an alert")
              #end            
         # end          
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

    def jawbone_params
        #params.require(:events).permit(:user_xid, :type, :action)
    end          
    
    def set_twillio_client
     twilio_sid = ENV['TWILLIO_SID']
     twilio_token = ENV['TWILLIO_TOKEN']
     twilio_phone_number = ENV['TWILLIO_NUMBER']
     @client = Twilio::REST::Client.new twilio_sid, twilio_token
   end
end
