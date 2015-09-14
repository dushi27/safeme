require 'test_helper'

class JawboneTest < ActiveSupport::TestCase
  setup do
    @jawbone1 = jawbones(:one)
    @jawbones2 = jawbones(:two)
  end
  
  test "create valid record with correct data" do
     assert true if @jawbone1.valid?
  end
  
  test "invalid without user_xid" do
    @jawbone1.user_xid = ''
    assert_not true if @jawbone1.valid?
  end
end
