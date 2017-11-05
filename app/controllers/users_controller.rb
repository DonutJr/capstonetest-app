class UsersController < ApplicationController

  def new
    render 'new.html.erb'
  end

  def create
    user = User.new(
                    username: params[:username],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation],
                    phone_number: params[:phone_number]
                    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Successfully created account"
      redirect_to '/'
    else
      flash[:warning] = "Invalid email or password"
      redirect_to "/signup"
    end

  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(
                            phone_number: params[:phone_number]
                            )
    @user.save
  end
                            


end
