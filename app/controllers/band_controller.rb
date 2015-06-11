class BandController < ApplicationController
  skip_before_action :verify_authenticity_token
    def jawbone
        if params[:events]
            @data = params[:events] 
            @event = Jawbone.new(:data => @data) 
            if @event.save
               render :json => {:success => 200} 
            else
                render :json => {:error => 400} 
            end
        else
            render :json => {:error => 400} 
        end
    end

end