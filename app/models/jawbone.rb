class Jawbone < ActiveRecord::Base
  belongs_to :users  
  
  validates :user_xid, presence: true
  
  after_commit :alert
    
  def should_alert?
    events = Jawbone.where(:user_xid => self.user_xid, :responded => nil).order(:created_at).limit(3)
    return false if events.count < 3 or (events.last.created_at - events.first.created_at) > 60
    return true   
  end    
    
 
  def alert
   return unless should_alert?
   emergency_contact = self.e_num1
   band_owner = self.firstname + ' ' + self.lastname
   message = $client.account.messages.create(:to => emergency_contact, :from => $twilio_phone_number,                        
                                   :body => "Safe.me recognized an alert from #{band_owner}")
   if message
    puts "ALERT WAS TRIGGERD FOR ________#(band_owner}________"
    events = Jawbone.where(:user_xid => self.user_xid, :responded => nil).order(:timestamp).limit(3)  
    events.each  do |e| 
      e.responded = ture; 
      e.save 
    end
   end
  end
end
