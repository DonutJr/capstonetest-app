class WalletsController < ApplicationController
  before_action :authenticate_user!

  def index
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
end
