class BandController < ApplicationController
  skip_before_action :verify_authenticity_token
    def jawbone
       render :json => {:success => 200} 
    end
end