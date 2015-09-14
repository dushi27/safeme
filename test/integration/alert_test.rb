require 'test_helper'

class AlertTest < ActionDispatch::IntegrationTest
  fixtures :users
  fixtures :jawbones

 setup do 
   @user = users(:two)
   @user.xid = 'RGaCBFg9CsB83FsEcMY44A'
 end
 
  test 'should have a valid pubsub url' do
    post jawbones_path, {   
    :notification_timestamp => 1379364954,
    :events => [
          {
           :action =>"enter_sleep_mode",
           :timestamp => 1379364951,
           :user_xid => "RGaCBFg9CsB83FsEcMY44A",
           :secret_hash => ENV['JAWBONE_SH']
          }
      ]
    }
    assert_response :success
  end
  
end