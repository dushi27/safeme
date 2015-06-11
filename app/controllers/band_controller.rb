class BandController < ApplicationController
  include JawbonesHelper
  skip_before_action :verify_authenticity_token
    before_action :init_twillio
    def jawbone
        unless params[:events].nil?
            count = Jawbone.all.count
            
          params[:events].each do |event|
            @event = Jawbone.new(:user_xid => event[:user_xid], :type => event[:type], :action => event[:action], :data => params[:events].to_s )
            @event.save
                if should_alert?(@event)  
                    @twilio_client.account.sms.messages.create(
                        :from => '+15005550006',
                        :to => twilio_phone_number,
                        :body => "Safe.me recognized an alert"
                        )
                end
            end
          end
          
          recount = Jawbone.all.count
            
          if recount == count + params[:events].count
            render :json => {:success => 200} 
          else
            render :json => {:error => 400} 
          end
        else
            render :json => {:error => 401} 
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