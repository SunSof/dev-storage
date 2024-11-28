class UsersController < ApplicationController
  include UserAuthorization

  # skip_before_action :authorize_user_access, only: [:index]

  def show
    @user = User.find(params[:id])
  end

  def agents_list
    @agents = User.where(role: :agent)
  end
end
