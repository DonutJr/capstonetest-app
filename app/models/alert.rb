class Alert < ApplicationRecord
  belongs_to :user
  belongs_to :coin



  def text_alert
      #how do i check to see if this only pulls specific user alerts?
      @alerts = Alert.where(triggered: nil)
      @coins = Coin.get_price
      @eth = Coin.find_by(ticker: "ETH")


      @alerts.each do |alert|
      if alert.
          account_sid = ENV['TWILIO_ACCOUNT_SID'] 
          auth_token = ENV['TWILIO_AUTH_TOKEN']

          @client = Twilio::REST::Client.new account_sid, auth_token
          message = @client.messages.create(
                                              body: "test8",
                                              to: "3108693215",
                                              from: "+12133221531"
                                              )
      end
  end
end
