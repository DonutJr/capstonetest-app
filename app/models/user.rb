class User < ApplicationRecord
  has_secure_password

  has_many :trades

  validates :username, uniqueness: true


  # def calculate_eth
  #   trades.inject(0) { |sum, trade| sum + trade.quantity if trade.coin.ticker == "ETH" } 
  # end


  # def calculate_rep
  #   trades.inject(0) { |sum, trade| sum + trade.quantity if trade.coin.ticker == "REP" } 
  # end

  def calculate_rep
    trades.where
  end

  # def calculate_dgd
  #   trades.inject(0) { |sum, trade| sum + trade.quantity if trade.coin.ticker == "DGD" } 
  # end

  # def calculate_omg
  #   trades.where coin ticker = omg then do a sum quantity
  # end




end
