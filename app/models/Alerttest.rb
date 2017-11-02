class Alert
    def initialize

    end

    def text_alert
        @coins = Coin.get_price.sort_by { |coin| coin.id }
        @eth = Coin.find_by(ticker: "ETH")
        if @eth.current_price > 270
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