class TradesController < ApplicationController
  before_action :authenticate_user!

  def index
    @coins = Coin.all
    @trades = Trade.all

  end


  def new

    @coins = Coin.all


  end


  def create
    @trade = Trade.new(
                          execution_price: params[:execution_price],
                          quantity: params[:quantity],
                          direction: params[:direction],
                          coin_id: params[:coin_id],
                          timestamp: params[:timestamp],
                          user_id: current_user.id
                          )
      if @trade.save
        flash[:success] = "Trade Successfully Entered"
        redirect_to "/trades/"
      else
        
        @errors = @trade.errors.full_messages
        render "new.html.erb"
      end

  end

  def show

    @trade = Trade.find(params[:id])
  end

  def edit
        @trade = Trade.find(params[:id])

  end

  

  def update

  @trade = Trade.find(params[:id])

  @trade.assign_attributes(
                              execution_price: params[:execution_price],
                              quantity: params[:quantity],
                              direction: params[:direction],
                              coin_id: params[:coin_id],
                              timestamp: params[:timestamp],
                              user_id: current_user.id
                              )

  if @trade.save
      flash[:success] = "Trade Successfully Updated"
      redirect_to "/trades/#{trade.id}"
    else
      @errors = @trade.errors.full_messages
    end

  p @trade.errors.full_messages
  # redirect_to "/trades"
  
  end

  def destroy
    trade = Trade.find(params[:id])
    trade.destroy
    redirect_to "/"
  end

end
