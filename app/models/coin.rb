class Coin < ApplicationRecord
  has_many :trades

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

end

# <h1>Welcome to Eth Coinmarketcap</h1>

# <h2>App for Ethereum asset management and daytrading needs. Calculate trade profits or manage your portfolio</h2>



# <% @coins.each_slice(3) do |coin_slice| %>
#   <div class="row">
#     <% coin_slice.each do |coin| %>
#       <div data-fancybox="quick-view1" data-qw-form="qw-form-1" class="col-md-4 col-sm-6 product-index-single">
#         <div>
#           <h2><%= coin.ticker %>: <a><%= coin.current_price %></a></h2>
#           <h3>Marketcap: <%= coin.current_price * coin.supply %></h3>
          
#         </div>
#       </div>
#     <% end %>
#   </div>
# <% end %>


