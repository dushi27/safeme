class Jawbone < ActiveRecord::Base
 after_create :alert
    
  #validates :event_xid, uniqueness: true
    
  def should_alert?
    events = Jawbone.where(:user_xid => self.user_xid, :responded => nil).order(:timestamp).limit(3)     
    return if events.count < 3 
    return if (events.last.timestamp - events.first.timestamp) > 60
    events.each {|e| return unless e.action == 'enter_sleep_mode' or e.action 'exit_sleep_mode'}
    true   
  end    
    
 private
  def alert
   return unless should_alert?

   user = User.where(:xid => self.user_xid).first
   to_number = user.e_num1
   band_owner = user.firstname + user.lastname
   
   $client.account.messages.create(:to => to_number, :from => $twilio_phone_number,                        
                                   :body => "Safe.me recognized an alert from #{band_owner}")
  end
end
