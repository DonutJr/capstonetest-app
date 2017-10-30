require 'twilio-ruby'

account_sid = "AC9f3622a24d8b8e27d5df6a2ec1131f0f" # Your Account SID from www.twilio.com/console
auth_token = "df0220d7f6aac6f3c7c16d3a570332c5"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Eth",
    to: "3108693215",    # Replace with your phone number
    from: "+12133221531")  # Replace with your Twilio number

puts message.sid