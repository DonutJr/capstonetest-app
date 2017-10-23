class WalletsController < ApplicationController
  before_action :authenticate_user!

  def index
      @coins = Coin.all
      @btc = Unirest.get("https://api.gdax.com/products/BTC-USD/ticker").body
      @allcoins = Unirest.get("https://bittrex.com/api/v1.1/public/getmarketsummaries").body['result']
      
      @coins.each do |coin|
        coin.current_price = @allcoins.select{ |token| token["MarketName"] == "BTC-#{coin.ticker}" }[0]["Last"] * @btc['price'].to_f
      end

    @wallets = Wallet.where(user_id: current_user.id)
  end

  def new
  end

  def create
    @wallet = Wallet.new(
                          address: params[:address],
                          user_id: current_user.id
                        )
    if @wallet.save
      flash[:success] = "Wallet Successfully Entered"
      redirect_to "/wallets/"
    else
      
      @errors = @wallet.errors.full_messages
      render "new.html.erb"
    end
  end

  def show
    @wallet = Wallet.find(params[:id])
  end

  def edit
    @wallet = Wallet.find(params[:id])
  end

  def update
    @wallet = Wallet.find(params[:id])
    @wallet.assign_attributes(
                            address: params[:address],
                            user_id: current_user.id
                            )
    @wallet.save
    if @wallet.save
      flash[:success] = "Wallet Successfully Updated"
      redirect_to "/wallets/"
    else
      @errors = @wallet.errors.full_messages
    end

    p @wallet.errors.full_messages
  end

  def destroy
    wallet = Wallet.find(params[:id])
    wallet.destroy
    redirect_to "/wallets"
  end
end
