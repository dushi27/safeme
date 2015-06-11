module JawbonesHelper
    
    
    def should_alert?(event)
        @events = Jawbone.where(:user_xid => event.user_xid).limit(3)
        alert = false and return if @events.count < 3
        if (@events.last.created_at - @events[1].created_at).in_milliseconds < 60000
            alert = true and return if (@events[1].created_at - @events.first.created_at).in_milliseconds < 60000            
        end
    end
    
    
end

