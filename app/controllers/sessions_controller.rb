class SessionsController < ApplicationController
  skip_before_filter :require_login, except: :destroy

  def new
    @user = User.new
  end

  def create
    if @user = login(session_params[:email], session_params[:password])
      redirect_to :root, notice: "Welcome #{@user.name}"
    else
      flash[:alert] = 'Nope!'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to :root, notice: 'Logged out'
  end

  protected

  def session_params
    params.require(:session).permit(:email)
  end
end
