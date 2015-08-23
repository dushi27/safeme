require 'twilio-ruby'

twilio_sid = ENV['TWILLIO_SID']
twilio_token = ENV['TWILLIO_TOKEN']

$twilio_phone_number = ENV['TWILLIO_NUMBER']
#$client = Twilio::REST::Client.new twilio_sid, twilio_token