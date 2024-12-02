class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    flash[:alert] = "Please login first"
    redirect_to login_path
  end
end
