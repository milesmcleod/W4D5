class UsersController < ApplicationController

  # before_action :require_logged_out

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    @user.ensure_session_token
    @user.activated = false
    @user.activation_token = SecureRandom::urlsafe_base64
    if @user.save
      msg = UserMailer.welcome_email(@user)
      msg.deliver_now
      redirect_to purgatory_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def activate
    @user = User.find_by(activation_token: params[:activation_token])
    if @user
      @user.activated = true
      login!(@user)
      redirect_to bands_url
    else
      render text: "I frankly don't know what's going on!"
    end
  end

  def purgatory
    render :purgatory
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
