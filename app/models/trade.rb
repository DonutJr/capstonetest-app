class Trade < ApplicationRecord

  belongs_to :coin
  belongs_to :user

  #validates :direction, presence: true

  def individual_trade_pnl
    if self.direction == "buy"
      (self.execution_price) * self.quantity
    else
      (self.execution_price) * self.quantity * -1
    end

  end

 




end
