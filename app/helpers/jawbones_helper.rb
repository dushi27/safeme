module JawbonesHelper       
    
  def should_alert?(event)
    @events = Jawbone.where(:user_xid => event.user_xid, :responded => nil).order(:timestamp).limit(3)        
    return if @events.count < 3 
    return if (@events.last.timestamp - @events.first.timestamp) > 60
    return unless @events[0].action == 'enter_sleep_mode' or @events[0].action == 'exit_sleep_mode'
    return unless @events[1].action == 'exit_sleep_mode' or @events[1].action == 'enter_sleep_mode'
    return unless @events[2].action == 'exit_sleep_mode' or @events[2].action == 'enter_sleep_mode'
    
    alert = true
    if alert
      @events.each do |activity|
        e = activity
        e.responded = true
        e.save
      end
    end
  end
    
end

