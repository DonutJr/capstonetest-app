class CoinsController < ApplicationController
    def index
      @coins = Coin.get_price
      @eth = Coin.find_by(ticker: "ETH")

    end

    def show
      @coin = Coin.find(params[:id])
    end
end
