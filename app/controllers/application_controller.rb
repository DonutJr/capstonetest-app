class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def coin_apis
      @eth= Unirest.get("https://api.gdax.com/products/ETH-USD/ticker").body
      @btc = Unirest.get("https://api.gdax.com/products/BTC-USD/ticker").body
      @rep = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=BTC-rep").body['result']['Last'].to_f * @btc['price'].to_f
      @dgd = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=BTC-DGD").body['result']['Last'].to_f * @btc['price'].to_f
      @gnt = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=BTC-gnt").body['result']['Last'].to_f * @btc['price'].to_f
      @omg = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=BTC-omg").body['result']['Last'].to_f * @btc['price'].to_f
      @pay = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=BTC-pay").body['result']['Last'].to_f * @btc['price'].to_f
      @bat = Unirest.get("https://bittrex.com/api/v1.1/public/getticker?market=BTC-bat").body['result']['Last'].to_f * @btc['price'].to_f
  end


end
