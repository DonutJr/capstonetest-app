class TradesController < ApplicationController
  before_action :authenticate_user!

  def index

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

end
