require 'test_helper'

class UserTest < ActiveSupport::TestCase
    setup do
        @user = users(:one)
        @user1 = users(:two)
    end
    
    test 'create user with correct info' do
        assert true if @user.valid?
    end
    
    test 'invalid without password' do
        @user.password = ''
        assert_not true if @user.valid?
    end
    
    test 'invalid without e_num1' do
        @user.e_num1 = ''
        assert_not true if @user.valid?
    end
    
    test 'invalid without xid' do
        @user.xid = ''
        assert_not true if @user.valid?
    end
    
    test 'invalid without unique xid' do
        assert_not true if @user1.valid?
    end
end
