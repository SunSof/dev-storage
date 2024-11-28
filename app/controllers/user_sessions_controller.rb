class UserSessionsController < ApplicationController
  include UserAuthorization

  skip_before_action :authorize_user_access, only: [:new, :create]
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email].downcase, params[:password])
    if @user
      redirect_to account_path(@user.id)
    else
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
