class WalletsController < ApplicationController
  before_action :authenticate_user!

  def index
    @coins = Coin.get_price
    @wallets = Wallet.all
    @eth = Coin.find_by(ticker: "ETH")
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
