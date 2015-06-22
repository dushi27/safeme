module JawbonesHelper       
    
    def should_alert?(event)
     @events = Jawbone.where(:user_xid => event.user_xid).order(:created_at).limit(3)        
     return if @events.count < 3 
     return if (@events.last.created_at - @events.first.created_at).in_milliseconds > 60000
     return unless @events[0].action == 'enter_sleep_mode' and @events[1].action == 'exit_sleep_mode' and @events[2].action == 'enter_sleep_mode'
     alert = true 
    end
    
    
end

