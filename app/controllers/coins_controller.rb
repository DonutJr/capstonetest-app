class CoinsController < ApplicationController
    def index
      @coins = Coin.get_price.sort_by { |coin| coin.id }
      @eth = Coin.find_by(ticker: "ETH")

    end

    def show
      @coin = Coin.find(params[:id])
    end
end
