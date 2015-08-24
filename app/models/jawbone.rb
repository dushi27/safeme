class Jawbone < ActiveRecord::Base
 after_create :alert
    
  def should_alert?
    events = Jawbone.where(:user_xid => Jawbone.last.user_xid, :responded => nil).order(:timestamp).limit(3)
    #and action = 'enter_sleep_mode' OR action = 'exit_sleep_mode'was removed bcz some pubsub resp. didn't have it
    return if events.count < 3 or (events.last.timestamp.to_i - events.first.timestamp.to_i) > 60
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
