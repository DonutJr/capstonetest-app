class AlertsController < ApplicationController

  def index
    @coins = Coin.get_price
    @alerts = Alert.all
  end

  def new
    @coins = Coin.get_price
  end

  def create
    @alert = Alert.new(
                          price: params[:price],
                          coin_id: params[:coin_id],
                          triggered: params[:triggered],
                          current_price: params[:current_price],
                          user_id: current_user.id
                          )
    if @alert.save
      flash[:success] = "ALert Successfully Entered"
      redirect_to "/alerts/"
    else
      
      @errors = @trade.errors.full_messages
      render "new.html.erb"
    end
  end

  def show
    @alert = Alert.find(params[:id])
  end

  def edit
    @alert = Alert.find(params[:id])
  end

  def update
    @alert = Alert.find(params[:id])
    @alert.assign_attributes(
                            execution_price: params[:execution_price],
                            quantity: params[:quantity],
                            direction: params[:direction],
                            coin_id: params[:coin_id],
                            timestamp: params[:timestamp],
                            user_id: current_user.id
                            )
    @alert.save
    if @alert.save
      flash[:success] = "Alert Successfully Updated"
      redirect_to "/alerts/"
    else
      @errors = @alert.errors.full_messages
    end

    p @alert.errors.full_messages
  end

  def destroy
    alert = Alert.find(params[:id])
    alert.destroy
    redirect_to "/alerts"
  end
end
