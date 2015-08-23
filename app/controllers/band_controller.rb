require 'twilio-ruby'
class BandController < ApplicationController
  include JawbonesHelper
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :set_twillio_client, only: [:jawbone]
    
    def jawbone
     
        
      params[:events].each do |event|
          next if event[:action] = 'updating' # (Time.now.to_i - event[:timestamp] ) > 60 or 
        @event = Jawbone.create(:user_xid => event[:user_xid], :event_xid => event[:timestamp], :action => event[:action], :data => params[:events].to_s)
        if @event.save
              if should_alert?(@event) 
                    puts "ALERT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"                  
                    twilio_phone_number = ENV['TWILLIO_NUMBER']
                    to_number = User.where(:xid => @event.user_xid).first.my_num
                     message = @client.account.messages.create(
                       :to => to_number,
                       :from => twilio_phone_number,                        
                       :body => "Safe.me recognized an alert")
               end            
         end                
        render :json => {:success => 200} 
     end
    end
    private
    
    def set_twillio_client
     twilio_sid = ENV['TWILLIO_SID']
     twilio_token = ENV['TWILLIO_TOKEN']
     twilio_phone_number = ENV['TWILLIO_NUMBER']
     @client = Twilio::REST::Client.new twilio_sid, twilio_token
    end

end