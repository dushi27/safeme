class BandController < ApplicationController
  include JawbonesHelper
  skip_before_action :verify_authenticity_token
    def jawbone
        unless params[:events].nil?
            count = Jawbone.all.count
            
          params[:events].each do |event|
            @event = Jawbone.new(:user_xid => event[:user_xid], :type => event[:type], :action => event[:action], :data => params[:events].to_s )
            @event.save
            if should_alert?(@event)  
                @twilio_client.account.sms.messages.create(
                  :from => ENV['TWILLIO_NUMBER'],
                  :to => ENV['TWILLIO_NUMBER'],
                    :body => "Safe.me recognized an alert"
                )
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

end