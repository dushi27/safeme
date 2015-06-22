class Jawbone < ActiveRecord::Base
    after_commit :should_alert, on: :create
    #validates :event_xid, uniqueness: true
   def should_alert
     events = Jawbone.where(:user_xid => self.user_xid).order(:created_at).limit(3)        
     return if events.count < 3 
     return if (events.last.created_at - events.first.created_at).in_milliseconds > 60000
     return unless events[0].action == 'enter_sleep_mode' and events[1].action == 'exit_sleep_mode' and events[2].action == 'enter_sleep_mode'
     
     twilio_sid = ENV['TWILLIO_SID']
     twilio_token = ENV['TWILLIO_TOKEN']
     twilio_phone_number = ENV['TWILLIO_NUMBER']
     @client = Twilio::REST::Client.new twilio_sid, twilio_token
       
     puts "ALERT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"    
     to_number = User.where(:xid => event.last.user_xid).first.my_num
     message = @client.account.messages.create(
       :to => to_number,
       :from => twilio_phone_number,                        
       :body => "Safe.me recognized an alert")

   end
end
