class UsersController < ApplicationController
  before_action :no_login_twice, only: [:new, :create]
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notices] = ["User was successfully created."]
      login!(@user)
      redirect_to root_url
    else
      flash.now[:notices] = @user.errors.full_messages
      @user = User.new(user_params)
      render :new
    end
  end

  def show
    @user = User.find(params[:id]);
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:f_name, :l_name, :email, :password_digest, :password)
  end

end
