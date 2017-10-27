class UsersController < ApplicationController

  # before_action :require_logged_out

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    @user.ensure_session_token
    if @user.save
      login!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
