class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = ["User was successfully created."]
      login!(@user)
      redirect_to root_url
    else
      flash[:notice] = @user.errors.full_messages
      @user = User.new(user_params)
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:f_name, :l_name, :email_address, :password_digest, :password)
  end

end
