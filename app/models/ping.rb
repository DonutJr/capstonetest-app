class Ping < ApplicationRecord
  belongs_to :user
  belongs_to :coin

  validates :price, presence: true
  validates :current_price, presence: true
  

  def self.text_alert
      #how do i check to see if this only pulls specific user alerts?
      @alerts = Ping.where(triggered: nil)
      @coins = Coin.get_price
      @eth = Coin.find_by(ticker: "ETH")

      @alerts.each do |alert|
      
        if (alert.current_price < alert.price && alert.coin.current_price > alert.price) || (alert.current_price > alert.price && alert.coin.current_price < alert.price)
            account_sid = ENV['TWILIO_ACCOUNT_SID'] 
            auth_token = ENV['TWILIO_AUTH_TOKEN']
            alert.triggered = true
            alert.save
            @client = Twilio::REST::Client.new account_sid, auth_token
            message = @client.messages.create(
                                                body: "#{alert.coin.ticker} trigger hit",
                                                to: "3108693215",
                                                from: "+12133221531"
                                                )

        end

      end
  end
end
