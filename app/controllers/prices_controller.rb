class PricesController < ApplicationController
  def index
    @coins = Coin.get_personal_price.sort_by { |coin| coin.id }
    @eth = Unirest.get("https://api.gdax.com/products/ETH-USD/ticker").body['price'].to_f
    @btc = Unirest.get("https://api.gdax.com/products/BTC-USD/ticker").body['price'].to_f
    @xmr = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=btc-xmr").body['result']['Last'].to_f
    @zec = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=btc-zec").body['result']['Last'].to_f
    end
end
