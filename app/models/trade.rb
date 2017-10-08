class Trade < ApplicationRecord

  belongs_to :coin
  belongs_to :user


  # def hello


  #   return "hello"

  # end

  # def calculate_eth
  #   eth = 0
  #   if self.coin_id ==1
  #     eth += self.quantity
  #   end

  # end
    
  # def calculate_rep
  #   rep = 0
  #   if self.coin_id ==2
  #     rep+= self.quantity
  #   end

  # end
    
  

  

  # def calculate_pnl

  # end
end
