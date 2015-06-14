class BandController < ApplicationController
  include JawbonesHelper
  skip_before_action :verify_authenticity_token
    
    def jawbone
        render :json => {:error => 400} and return if params[:events].nil?
        count = Jawbone.all.count
            
        params[:events].each do |event|
            count - 1 and next if (Time.now.to_i - event[:timestamp] ) > 60000
            @event = Jawbone.new(:user_xid => event[:user_xid], :action => event[:action], :data => params[:events].to_s )
            @event.save
                if should_alert?(@event) 
                  puts "ALERT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
                  
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