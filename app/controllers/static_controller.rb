class StaticController < ApplicationController
  before_action :set_req_variables, only: [:index]
  layout "website", :only => :index
  
  def index
    @url = "https://#{@base}response_type=code&client_id=#{$jb_client_id}&scope=#{@scopes}&redirect_uri=#{@redirect_url}"
  end
  
  private
  
  def set_req_variables
    @base = 'jawbone.com/auth/oauth2/auth?'
    @scopes = 'basic_read move_read  sleep_read'
    @redirect_url = 'http://safeme.herokuapp.com/auth_response'
  end
end