class BandController < ApplicationController
  skip_before_action :verify_authenticity_token
    def jawbone
        unless params[:events].nil?
            @data = params[:events] 
            @event = Jawbone.new(:data => params[:events] ) 
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