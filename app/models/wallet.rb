class Wallet < ApplicationRecord
  belongs_to :user
  
  validates :address, presence: true

  def get_eth_balance
    Unirest.get("https://api.etherscan.io/api?module=account&action=balance&address=#{address}&tag=latest").body['result'].to_f / 1000000000000000000
  end


  


  


  
end
