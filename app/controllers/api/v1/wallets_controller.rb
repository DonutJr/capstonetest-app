class Api::V1::WalletsController < ApplicationController
  before_action :authenticate_user!

  def index
    @coins = Coin.get_price.sort_by { |coin| coin.id }
    if current_user
      @wallets = Wallet.where(user_id: current_user)
      render json: {
        wallets: @wallets.as_json,
        coins: @coins.as_json
      }
    end
  end

  def create
    @wallet = Wallet.new(
                          address: params[:address],
                          user_id: current_user.id
                        )
    if @wallet.save
      flash[:success] = "Wallet Successfully Entered"
      render json: @wallet
    else
      
      @errors = @wallet.errors.full_messages
      render "new.html.erb"
    end
  end

  
  def destroy
    wallet = Wallet.find(params[:id])
    wallet.destroy
    render json: wallet
  end
end
