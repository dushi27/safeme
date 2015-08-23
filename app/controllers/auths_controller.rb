require 'unirest'
class AuthsController < ApplicationController
  before_action :set_resp_variables, only: [:auth_response]
  before_action :set_req_variables, only: [:auth_request]
  
  def auth_request
    redirect_to "https://#{@base}response_type=code&client_id=#{$jb_client_id}&scope=#{@scopes}&redirect_uri=#{@redirect_url}"
  end

  def auth_response  
    req = "https://jawbone.com/auth/oauth2/token?client_id=#{$jb_client_id}&client_secret=#{$jb_secret}&grant_type=authorization_code&code=#{params[:code]}"
    @resp = Unirest.get req
    if @resp.code == 200
      @user_req = Unirest.get 'https://jawbone.com/nudge/api/v.1.1/users/@me', headers: {"Authorization" => "Bearer #{@resp.body['access_token']}"}
       
     if @user_req.code == 200
      @user = User.create(:xid => @user_req.body['data']['xid'], :firstname => @user_req.body['data']['first'],  :lastname => @user_req.body['data']['last'], :token => @resp.body['access_token'])
      redirect_to edit_user_path(@user.id)
     end
    end
  end
  
 private
  
  def set_req_variables
    @base = 'jawbone.com/auth/oauth2/auth?'
    @scopes = 'basic_read move_read  sleep_read'
    @redirect_url = 'http://safeme.herokuapp.com/auth_response'
  end
  
  def set_resp_variables
    @code = params[:code]
  end
end
