class SessionsController < ApplicationController
  before_action :no_login_twice, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      user_params[:email], 
      user_params[:password]
    )
    if @user
      login!(@user)
      redirect_to root_url
    else
      flash.now[:notices] = ["Invalid name/password combination"]
      @user = User.new(email: user_params[:email])
      render :new
    end
  end

  def destroy
    logout!
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
