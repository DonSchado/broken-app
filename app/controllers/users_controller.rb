class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  skip_before_filter :require_login, only: [:new, :create]

  def show
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params)

    if @user.save
      auto_login @user
      redirect_to :root, notice: 'Your account was created successfully!'
    else
      render action: 'new'
    end
  end

  def update
    # your code codes here
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :email, :password)
  end
end
