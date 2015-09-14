require 'test_helper'

class AlertTest < ActionDispatch::IntegrationTest
  fixtures :users
  fixtures :jawbones
  
  setup do 
    User.delete_all
    Jawbone.delete_all
  end
  
  
end