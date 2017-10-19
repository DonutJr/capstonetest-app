class Coin < ApplicationRecord
  has_many :trades

 def coin_price
  @btc = Unirest.get("https://api.gdax.com/products/BTC-USD/ticker").body
  Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=BTC-#{ticker}").body['result']['Last'].to_f * @btc['price'].to_f
 end
  
end
