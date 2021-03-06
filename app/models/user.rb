class User < ApplicationRecord
  has_secure_password
  has_many :trades
  has_many :wallets
  has_many :pings
  validates :username, uniqueness: true

  def calculate_quantity(arg)
    buys = trades.where("#{:coin_id} = #{arg} AND #{:direction} = 'buy' ").sum(:quantity)
    sells = trades.where("#{:coin_id} = #{arg} AND #{:direction} = 'sell' ").sum(:quantity)
    return buys - sells
  end

  def sum_pnl_coin(arg)
      trades.where("#{:coin_id} = #{arg}").each.sum {|trade| trade.individual_trade_pnl }
  end

  def total_pnl
    trades.all.each.sum { |trade| trade.individual_trade_pnl }
  end

  def total_eth_portfolio
    wallets.each.sum{|wallet| wallet.get_eth_balance * Coin.first.current_price } 
  end
##fix
  def total_token_portfolio
    port = 0
    allwallets = Wallet.all
    allwallets.each do |wallet|
      Coin.all.each do |coin|
        if wallet.token_balance(coin) != 0
          port += wallet.token_balance(coin) #coin.coin_price * 
        end
      end
    end
    return port
  end

  def total_portfolio
    total_eth_portfolio + total_token_portfolio
  end


  
  
end

# <h2>Total Portfolio value: <%= current_user.total_portfolio %></h2>
# <h3>Total Token value: <%= current_user.total_token_portfolio %></h3>

# <h3>Token balances:</h3>
#   <ul>
#     <% @coins.each do |coin| %>
#       <% if wallet.token_balance(coin) != 0 %>
#         <h3><%= coin.ticker %> Balance: <%= wallet.token_balance(coin) %></h3>
#         <h3><%= coin.ticker %> Price: <%= coin.current_price %></h3>
#         <h3><%= coin.ticker %> Market Value: <%= wallet.token_balance(coin) * coin.current_price %></h3>
#       <% end %>
#     <% end %>
#   </ul>


