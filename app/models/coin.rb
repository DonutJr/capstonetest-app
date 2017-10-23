class Coin < ApplicationRecord
  has_many :trades

  def self.allcoins
      return @allcoins 
  end

  def self.btc
    return @btc['price'].to_f
  end

  def something_else
  end

  def new_current_price
    return Coin.btc

    # self.allcoins.select{ |token| token["MarketName"] == "BTC-#{ticker}" }[0]["Last"] * @btc['price'].to_f
  end
end


