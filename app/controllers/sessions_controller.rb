class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user
      if @user.activated
        login!(@user)
        redirect_to bands_url
      else
        redirect_to purgatory_url
      end
    else
      flash.now[:errors] = ["invalid login credentials"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
