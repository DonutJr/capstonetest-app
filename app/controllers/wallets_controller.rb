class WalletsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @coins = Coin.where.not(id: 1).get_price.sort_by { |coin| coin.id }
    @coins = Coin.get_price.sort_by { |coin| coin.id }
    if current_user
      @wallets = Wallet.where(user_id: current_user)
      render json: {
        wallets: @wallets.as_json,
        coins: @coins.as_json
      }
    end
  end

  def vue_index
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

  def wallettest5

    @coins = Coin.where.not(id: 1).get_price.sort_by { |coin| coin.id }
    if current_user
      @wallets = Wallet.where(user_id: current_user)
    end

  end
end
