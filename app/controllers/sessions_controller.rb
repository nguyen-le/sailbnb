class SessionsController < ApplicationController
  before_action :no_login_twice, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      user_params[:email_address], 
      user_params[:password]
    )

    if @user
      login!(@user)
      redirect_to root_url
    else
      flash.now[:notices] = ["Invalid name/password combination"]
      @user = User.new(email_address: user_params[:email_address])
      render :new
    end
  end

  def destroy
    logout!
    redirect_to '/login' 
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password)
  end

  def no_login_twice
    if logged_in?
      redirect_to root_url
    end
  end

end
