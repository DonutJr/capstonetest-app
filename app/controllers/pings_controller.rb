class PingsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @coins = Coin.get_price
    if current_user
      @alerts = Ping.where(user_id: current_user)
    end
  end

  def new
    @coins = Coin.get_price
  end

  def create
    @alert = Ping.new(
                      price: params[:price],
                      coin_id: params[:coin_id],
                      triggered: params[:triggered],
                      current_price: params[:current_price],
                      user_id: current_user.id
                      )
    if @alert.save
      flash[:success] = "Alert Successfully Entered"
      redirect_to "/alerts"
    else 
      @errors = @trade.errors.full_messages
      render "new.html.erb"
    end
  end

  def destroy
    alert = Ping.find(params[:id])
    alert.destroy
    redirect_to "/alerts"
  end
end
