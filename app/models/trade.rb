class Trade < ApplicationRecord

  belongs_to :coin
  belongs_to :user

  #validates :direction, presence: true

  def individual_trade_pnl
    if self.direction == "buy"
      (self.coin.current_price - self.execution_price) * self.quantity
    else
      (self.coin.current_price - self.execution_price) * self.quantity * -1
    end
  end

 




end
