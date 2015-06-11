class BandController < ApplicationController
  skip_before_action :verify_authenticity_token
    def jawbone
        @data = params["events"]
        @event = Jawbone.new(:data => @data)
        if @event.save
       render :json => {:success => 200} 
        else
             render :json => {:success => 200} 
        end
    end
end