class User < ApplicationRecord
  has_secure_password

  has_many :trades

  validates :username, uniqueness: true


  # def calculate_eth
  #   trades.inject(0) { |sum, trade| sum + trade.quantity if trade.coin.ticker == "ETH" } 
  # end

  def calculate_quantity(arg)
    trades.where("#{:coin_id} = #{arg}").sum(:quantity)
  end

  def calculate_quantity(arg)
    trades.where("#{:coin_id} = #{arg}").sum(:quantity)
  end




  
  def calculate_eth
    trades.where("#{:coin_id} = 1").sum(:quantity)
  end


  def calculate_rep
    trades.where("#{:coin_id} = 2").sum(:quantity)
  end

  def calculate_dgd
    trades.where("#{:coin_id} = 3").sum(:quantity)
  end

  def calculate_omg
    trades.where("#{:coin_id} = 4").sum(:quantity)
  end





end
