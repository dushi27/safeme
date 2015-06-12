require 'unirest'
class StaticController < ApplicationController

  def home
      #twilio_sid = ENV['TWILLIO_SID']
      #twilio_token = ENV['TWILLIO_TOKEN']
      #twilio_phone_number = ENV['TWILLIO_NUMBER']
      twilio_sid = 'AC8133cb0651c8818cf31dc3afc25ec549'
      twilio_token = 'a5dddef5d96e44dd2b8e698505820483'
      twilio_phone_number ='+19177025523'
      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

      
      message = @twilio_client.account.messages.create(
                        :to => twilio_phone_number,
                        :from => '+19133966829',                        
                        :body => "Safe.me recognized an alert")
  end
    
  def connect      
      @code = params[:code]
      @client_id = 'Xv1L6lEDVng'
      @secret = '633e83e5aeac2c821a770007beda765650aaf8d7'
      
      req = "https://jawbone.com/auth/oauth2/token?client_id=#{@client_id}&client_secret=#{@secret}&grant_type=authorization_code&code=#{params[:code]}"
      @resp = Unirest.get req
    if @resp.code == 200
        @user_req = Unirest.get 'https://jawbone.com/nudge/api/v.1.1/users/@me', headers: {"Authorization" => "Bearer #{@resp.body['access_token']}"}
       
     if @user_req.code == 200
       @user = User.create(:xid => @user_req.body['data']['xid'], :firstname => @user_req.body['data']['first'],  :lastname => @user_req.body['data']['last'], :token => @resp.body['access_token'])
         redirect_to edit_user_path(@user.id)
     end
    end
  end
end
