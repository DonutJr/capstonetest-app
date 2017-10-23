class CoinsController < ApplicationController
    def index
      @coins = Coin.all
      @btc = Unirest.get("https://api.gdax.com/products/BTC-USD/ticker").body
      @allcoins = Unirest.get("https://bittrex.com/api/v1.1/public/getmarketsummaries").body['result']
      
      @coins.each do |coin|
        coin.current_price = @allcoins.select{ |token| token["MarketName"] == "BTC-#{coin.ticker}" }[0]["Last"] * @btc['price'].to_f
      end

      # @coins = Coin.all_coins(btc, )
    end

    def show
      ##FIX THIS  
      @coinlist = JSON.parse(File.read('coin_list.json'))

      @coinlist.each do |coin|
        @coins << Coin.new(
                              {ticker: coin['ticker'],
                              name: coin['name'],
                              current_price: @rep,
                              change: 0,
                              marketcap: 100,
                              timestamp: "january"
                              }
                          )
      end


    end
end
