class Coin < ApplicationRecord
  has_many :trades
  has_many :alerts

  def self.get_price
    api_data = Unirest.get("https://bittrex.com/api/v1.1/public/getmarketsummaries").body['result']
    btc = Unirest.get("https://api.gdax.com/products/BTC-USD/ticker").body['price'].to_f
    all.each do |coin|
      coin.update(current_price: api_data.select{ |token| token["MarketName"] == "BTC-#{coin.ticker}" }[0]["Last"] * btc)
    end
  end

  def marketcap
    self.current_price * self.supply
  end

  def self.get_personal_price
    api_data = Unirest.get("https://bittrex.com/api/v1.1/public/getmarketsummaries").body['result']
    main_coin_tickers = ["OMG", "REP", "DGD", "XMR", "ZEC"]
    main_coins = all.select { |coin| main_coin_tickers.include? coin.ticker }

    main_coins.each do |coin|
      coin.update(current_price: api_data.select{ |token| token["MarketName"] == "ETH-#{coin.ticker}" }[0]["Last"] )
    end
  end

end

