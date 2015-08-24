class Jawbone < ActiveRecord::Base
 after_create :alert
    
  #validates :event_xid, uniqueness: true
    
  def should_alert?
    events = Jawbone.find_by_sql("SELECT * from jawbones where user_xid='#{self.user_xid}' AND responded <> true ORDER BY timestamp DESC LIMIT 3")  
    #and action = 'enter_sleep_mode' OR action = 'exit_sleep_mode' 
    return if events.count < 3 or (events.first.timestamp.to_i - events.last.timestamp.to_i) > 60
    #events.each {|e| return unless e.action == 'enter_sleep_mode' or e.action 'exit_sleep_mode'}
    true   
  end    
    
 
  def alert
   return unless should_alert?
   user = User.where(:xid => self.user_xid).first
   to_number = user.e_num1
   band_owner = user.firstname + user.lastname
   message = $client.account.messages.create(:to => to_number, :from => $twilio_phone_number,                        
                                   :body => "Safe.me recognized an alert from #{band_owner}")
   if message
    events = Jawbone.where(:user_xid => self.user_xid, :responded => nil).order(:timestamp).limit(3)  
    events.each {|e| e.responded = ture; e.save }
   end
  end
end
