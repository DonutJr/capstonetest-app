class CoinsController < ApplicationController
  require 'json'


  def index
    # @coins = Coin.all
    coin_list = [
                ]
    @coins = []
     @eth= Unirest.get("https://api.gdax.com/products/ETH-USD/ticker").body
    @btc = Unirest.get("https://api.gdax.com/products/BTC-USD/ticker").body
    rep = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=BTC-rep").body['result']['Last'].to_f * @btc['price'].to_f
    @dgd = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=BTC-DGD").body['result']['Last'].to_f * @btc['price'].to_f
    @gnt = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=BTC-gnt").body['result']['Last'].to_f * @btc['price'].to_f
    @omg = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=BTC-omg").body['result']['Last'].to_f * @btc['price'].to_f
    @pay = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=BTC-pay").body['result']['Last'].to_f * @btc['price'].to_f
    @bat = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=BTC-bat").body['result']['Last'].to_f * @btc['price'].to_f


    @coinlist = JSON.parse(File.read('coin_list.json'))

    @coinlist.each do |coin|
      @coins << Coin.new(
                        {ticker: coin['ticker'],
                        name: coin['name'],
                        current_price: coin['ticker']
                        change: 0,
                        marketcap: 100,
                        timestamp: "january"
                        }
                        )
    end
























  end


end
