class CoinsController < ApplicationController
    require 'json'
    before_action :coin_apis

    def index
        # @coins = Coin.all
        @coin_list = []
        @coinlist = JSON.parse(File.read('coin_list.json'))
        
        @coins = []
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

    def show
        @coin_list = []
        @coins = []
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
