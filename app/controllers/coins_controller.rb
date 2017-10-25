class CoinsController < ApplicationController
    def index
      @coins = Coin.get_price
    end

    def show
      ##FIX THIS  
      @coinlist = JSON.parse(File.read('coin_list.json'))

      @coinlist.each do |coin|
        @coins << Coin.new(
                              {ticker: coin['ticker'],
                              name: coin['name'],
                              current_price: @rep,
                              change: 0,
                              marketcap: 100,
                              timestamp: "january"
                              }
                          )
      end


    end
end
