class BandController < ApplicationController
  include JawbonesHelper
  skip_before_action :verify_authenticity_token
    
    def jawbone
        render :json => {:error => 400} and return if params[:events].nil?
        count = Jawbone.all.count
            
        params[:events].each do |event|
            @event = Jawbone.new(:user_xid => event[:user_xid], :action => event[:action], :data => params[:events].to_s )
            @event.save
                if should_alert?(@event) 
                  puts "ALERT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
                  
                  twilio_sid = ENV['TWILLIO_SID']
                  twilio_token = ENV['TWILLIO_TOKEN']
                  twilio_phone_number = ENV['TWILLIO_NUMBER']
                    
                  @client = Twilio::REST::Client.new twilio_sid, twilio_token
                  to_number = User.where(:xid => @event.user_xid).first.my_num
                  message = @client.account.messages.create(
                    :to => to_number,
                    :from => twilio_phone_number,                        
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
    

end