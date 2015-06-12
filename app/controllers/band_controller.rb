class BandController < ApplicationController
  include JawbonesHelper
  skip_before_action :verify_authenticity_token
  #before_action :init_twillio
    def jawbone
        render :json => {:error => 400} and return if params[:events].nil?
        count = Jawbone.all.count
            
        params[:events].each do |event|
            @event = Jawbone.new(:user_xid => event[:user_xid], :action => event[:action], :data => params[:events].to_s )
            @event.save
                if should_alert?(@event) 
                  puts "ALERT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
                  form_number = User.where(:user_xid => @event.user_xid)
                  message = @twilio_client.account.messages.create(
                    :to => twilio_phone_number,
                    :from => twillio_from_number,                        
                    :body => "Safe.me recognized an alert")
                end
          end                    
          recount = Jawbone.all.count
            
          if recount == count + params[:events].count
            render :json => {:success => 200} 
          else
            render :json => {:error => 400} 
          end

    end
    
    
    private
    
    
    def init_twillio
      twilio_sid = ENV['TWILLIO_SID']
      twilio_token = ENV['TWILLIO_TOKEN']
      twilio_phone_number = ENV['TWILLIO_NUMBER']

      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    end


end