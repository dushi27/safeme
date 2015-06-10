class BandController < ApplicationController
  skip_before_action :verify_authenticity_token
    def jawbone
        @data = params["events"].first["user_xid"]
        @event = Jawbone.new(:user_xid => @data)
        @event.save
       render :json => {:success => 200} 
    end
end