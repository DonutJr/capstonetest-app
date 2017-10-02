class Trade < ApplicationRecord

  belongs_to :coin
  belongs_to :user


  def hello

  end

  def calculate_position

    @trades.each do |trade|
      
      
    end


  end

  def calculate_pnl

  end
end
