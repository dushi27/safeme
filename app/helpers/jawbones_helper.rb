module JawbonesHelper
    
    
    def should_alert?(event)
        @events = Jawbone.where(:user_xid => event.user_xid).limit(3)
        alert = false and return if @events.count < 3
        if (@events.last - @events[1]).in_milliseconds < 60000
            alert = true and return if (@events[1] - @events.first).in_milliseconds < 60000            
        end
    end
    
    
end

