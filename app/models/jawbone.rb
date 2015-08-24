class Jawbone < ActiveRecord::Base
 after_commit :alert
    
  def should_alert?
    events = Jawbone.where(:user_xid => self.user_xid, :responded => nil).order(:timestamp).limit(3)
    return if  events[0].action == 'updation' 
    return if  events[1].action == 'updation' 
    return if  events[2].action == 'updation' 
    return if events.count < 3 or (events.last.created_at - events.first.created_at) > 60
    true   
  end    
    
 
  def alert
   return unless should_alert?
   user = User.where(:xid => self.user_xid).first
   to_number = user.e_num1
   band_owner = user.firstname + ' ' + user.lastname
   message = $client.account.messages.create(:to => to_number, :from => $twilio_phone_number,                        
                                   :body => "Safe.me recognized an alert from #{band_owner}")
   if message
    puts 'SENT THE MESSAGE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    events = Jawbone.where(:user_xid => self.user_xid, :responded => nil).order(:timestamp).limit(3)  
    events.each  do |e| 
      e.responded = ture; 
      e.save 
    end
   end
  end
end
